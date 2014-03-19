VacancySearch.IndexRoute = Ember.Route.extend
    beforeModel: ->
        criteria = @controllerFor('application').get('searchCriteria')
        if criteria.hasSearchParams()
            return @transitionTo('vacancies')
        else
            return @transitionTo('filter')
