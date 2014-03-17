VacancySearch.FilterController = Ember.Controller.extend
    textArray: []
    salary: ''
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
            console.log(@get 'text')
            console.log(@get('salary'))
            console.log(@get('specialization'))
            console.log(@get('onlyWithSalary'))
            console.log(@get('currency'))
            console.log(@get('text'))
            console.log(@get('employment'))
            console.log(@get('schedule'))
