VacancySearch.VacanciesRoute = Ember.Route.extend
    model: ->
        criteria = @controllerFor('application').get('searchCriteria')
        if criteria.hasSearchParams()
            return @store.find('vacancy', criteria.searchParams())
        else
            return []
