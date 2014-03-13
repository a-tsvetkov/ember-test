VacancySearch.IndexRoute = Ember.Route.extend
    beforeModel: -> @transitionTo('filter')
