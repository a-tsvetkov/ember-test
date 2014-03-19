VacancySearch.ApplicationRoute = Ember.Route.extend
    model: -> Ember.RSVP.hash
        criteria: @store.find('filter').then((items) =>
            if items.content.length == 0
                return @store.createRecord('filter')
            else
                return items.get('firstObject')
            )
        dictionaries: $.getJSON('https://api.hh.ru/dictionaries')
        areas: $.getJSON('https://api.hh.ru/areas').then((data) ->
            getChildAreas = (item) ->
                if $.isArray(item.areas) and item.areas.length > 0 then [item].concat $.map(item.areas, getChildAreas) else item

            flattened = []
            for country in data
                for area in $.map(country.areas, getChildAreas)
                    area.country = country.name
                    flattened.push area

            flattened
            )
        specializations: $.getJSON('https://api.hh.ru/specializations').then (data) ->
            data.sort (a, b) -> Number(a.id) - Number(b.id)

    afterModel: (model) ->
        # Ensure searchCriteria is available in child routes
        @controllerFor('application').set 'searchCriteria', model.criteria


    setupController: (controller, model) ->
        controller.set 'dictionaries', model.dictionaries

        defaultCurrency = model.dictionaries.currency.find (val) -> val.default
        controller.set 'searchCriteria.currency', defaultCurrency
        controller.set 'defaultCurrency', defaultCurrency
        controller.set 'areas', model.areas
        controller.set 'specializations', model.specializations

        controller.set 'menuItems',  [
            { route: 'filter', name: 'Настройки' }
            { route: 'vacancies', name: 'Вакансии' }
            { route: 'about', name: 'О приложении' }
        ]
