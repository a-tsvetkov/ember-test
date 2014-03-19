VacancySearch.ApplicationRoute = Ember.Route.extend
    model: -> Ember.RSVP.hash
        criteria: @store.find('filter').then((items) =>
            if items.content.length == 0
                return @store.createRecord('filter')
            else
                return items.firstObject
            )

    setupController: (controller, model) ->
        controller.set 'searchCriteria', model.criteria
        controller.set 'menuItems',  [
            { route: 'filter', name: 'Настройки' }
            { route: 'vacancies', name: 'Вакансии' }
            { route: 'about', name: 'О приложении' }
        ]
