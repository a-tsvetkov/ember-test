VacancySearch.FilterRoute = Ember.Route.extend
    model: -> Ember.RSVP.hash
        dictionaries: $.getJSON('https://api.hh.ru/dictionaries')
        areas: $.getJSON('https://api.hh.ru/areas').then((data) ->
            getChildAreas = (item) ->
                if $.isArray(item.areas) and item.areas.length > 0 then $.map(item.areas, getChildAreas) else item

            flattened = []
            for country in data
                for area in $.map(country.areas, getChildAreas)
                    area.group = country.name
                    flattened.push area

            flattened
        )
        specializations: $.getJSON('https://api.hh.ru/specializations').then (data) ->
            data.sort (a, b) -> Number(a.id) - Number(b.id)

    setupController: (controller, model) ->
        controller.set('dictionaries', model.dictionaries)
        controller.set('areas', model.areas)
        controller.set('specializations', model.specializations)
        defaultCurrency = model.dictionaries.currency.find (val) -> val.default
        controller.set('currency', defaultCurrency)
