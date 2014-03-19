VacancySearch.Filter = DS.Model.extend
    textArray: DS.attr(null, defaultValue: [])
    salary: DS.attr('number')
    onlyWithSalary: DS.attr('boolean', defaultValue: false)
    area: DS.attr(null, defaultValue: [])
    specialization: DS.attr(null, defaultValue: [])
    currency: DS.attr()
    employment: DS.attr(null, defaultValue: [])
    schedule: DS.attr(null, defaultValue: [])

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

    searchParams: () ->
        params =
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

        return params
