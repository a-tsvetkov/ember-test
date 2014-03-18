VacancySearch.FilterController = Ember.Controller.extend
    needs: ['application']

    textArray: []
    salary: null
    onlyWithSalary: false
    area: []
    specialization: []
    currency: null
    employment: []
    schedule: []

    allSpecializations: ((key,  value)->
        if value? and value is true
            @set 'specialization', []

        @get('specialization').length == 0
        ).property('specialization.@each')

    text: ((key, value) ->
        if value?
            @set 'textArray', value.split(' ')

        @get('textArray').join(' ')
        ).property('textArray.@each')

    actions:
        submit: () ->
            criteria =
                text: @get 'text'
                salary: @get 'salary'
                only_with_salary: @get 'onlyWithSalary'
                area: @get 'area'
                specialization: @get 'specialization'
                currency: @get 'currency.code'
                employment: @get 'employment'
                schedule: @get 'schedule'

            delete criteria.currency unless criteria.salary
            for key, value of criteria
                delete criteria[key] unless value

            @set('controllers.application.searchCriteria', criteria)
            @transitionTo('vacancies')
