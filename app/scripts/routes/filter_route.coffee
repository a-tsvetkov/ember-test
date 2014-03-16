VacancySearch.FilterRoute = Ember.Route.extend
    model: -> Ember.RSVP.hash
        dictionaries: Ember.$.getJSON('https://api.hh.ru/dictionaries')
        areas: Ember.$.getJSON('https://api.hh.ru/areas/').then((data) ->
            getChildAreas = (item) ->
                if $.isArray(item.areas) and item.areas.length > 0 then $.map(item.areas, getChildAreas) else item

            flattened = []
            for country in data
                $.map(data, getChildAreas)
                flattened.push {name: country.name, areas: $.map(country.areas, getChildAreas)}

            return flattened
        )

    setupController: (controller, model) ->
        controller.set('dictionaries', model.dictionaries)
        controller.set('areas', model.areas)
