VacancySearch.ApplicationRoute = Ember.Route.extend
    model: -> Ember.RSVP.hash
        criteria: @store.find('filter').then((items) =>
            if items.content.length == 0
                return @store.createRecord('filter')
            else
                return items.get('firstObject')
            )
        dictionaries: $.getJSON('https://api.hh.ru/dictionaries')

    afterModel: (model) ->
        # Ensure searchCriteria is available in child routes
        @controllerFor('application').set 'searchCriteria', model.criteria

    setupController: (controller, model) ->
        controller.set 'dictionaries', model.dictionaries

        defaultCurrency = model.dictionaries.currency.find (val) -> val.default
        controller.set 'searchCriteria.currency', defaultCurrency
        controller.set 'defaultCurrency', defaultCurrency

        controller.set 'menuItems',  [
            { route: 'filter', name: 'Настройки' }
            { route: 'vacancies', name: 'Вакансии' }
            { route: 'about', name: 'О приложении' }
        ]
