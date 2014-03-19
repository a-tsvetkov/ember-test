VacancySearch.FilterController = Ember.Controller.extend
    needs: ['application']

    criteria: Ember.computed.alias('controllers.application.searchCriteria')

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
            console.log @get 'criteria'

            @transitionTo('vacancies')
