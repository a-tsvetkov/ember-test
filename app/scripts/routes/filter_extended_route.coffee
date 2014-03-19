VacancySearch.FilterExtendedRoute = Ember.Route.extend

    setupController: (controller, model) ->
        controller.set 'criteria.extended', true
