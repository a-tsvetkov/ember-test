VacancySearch.Filter = DS.Model.extend
    textArray: DS.attr(null, defaultValue: [])
    salary: DS.attr('number')
    onlyWithSalary: DS.attr('boolean', defaultValue: false)
    area: DS.attr(null, defaultValue: [])
    specialization: DS.attr(null, defaultValue: [])
    currency: DS.attr("string")
    employment: DS.attr(null, defaultValue: [])
    schedule: DS.attr(null, defaultValue: [])

    extended: DS.attr('boolean', defaultValue: false)

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
            area: (a.id for a in @get 'area')
            specialization: @get 'specialization'
            currency: @get 'currency'
            employment: @get 'employment'
            schedule: @get 'schedule'

        delete params.currency unless params.salary
        for key, value of params
            if not value or (value.length? and value.length == 0)
                delete params[key]

        return params

    hasSearchParams: -> not (Object.keys(@searchParams()).length == 0)
