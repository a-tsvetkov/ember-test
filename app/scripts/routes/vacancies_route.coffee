VacancySearch.VacanciesRoute = Ember.Route.extend
    model: ->
        criteria = @controllerFor('application').get('searchCriteria')
        if criteria?
            @store.find('vacancy', criteria.searchParams())
        else
            []
