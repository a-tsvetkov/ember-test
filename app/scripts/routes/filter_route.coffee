VacancySearch.FilterRoute = Ember.Route.extend
    afterModel: (model) ->
        if @controllerFor('application').get('searchCriteria.extended')
            @transitionTo('filter.extended')
