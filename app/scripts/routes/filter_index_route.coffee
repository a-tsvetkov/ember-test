VacancySearch.FilterIndexRoute = Ember.Route.extend

    setupController: (controller, model) ->
        controller.set 'criteria.extended', false
