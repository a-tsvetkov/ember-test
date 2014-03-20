VacancySearch.VacanciesController = Ember.Controller.extend
    needs: ['application']
    queryParams: ['sort']

    sort: null
    loading: false
