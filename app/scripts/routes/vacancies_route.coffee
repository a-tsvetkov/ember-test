VacancySearch.VacanciesRoute = Ember.Route.extend
    model: ->
        @store.find('vacancy', {text: "python", salary: 120000, schedule: ['fullDay', 'remote']})
