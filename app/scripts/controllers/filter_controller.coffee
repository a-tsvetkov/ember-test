VacancySearch.FilterController = Ember.Controller.extend
    text: ''
    salary: ''
    area: []
    specialization: []
    currency: ''
    employment: []
    schedule: []

    actions:
        submit: () ->
            console.log(@get('salary') + @get('text'))
