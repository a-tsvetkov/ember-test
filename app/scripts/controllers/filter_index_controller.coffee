VacancySearch.FilterIndexController = Ember.Controller.extend
    needs: ['filter']
    filter: Ember.computed.alias('controllers.filter')
    criteria: Ember.computed.alias('controllers.filter.criteria')

    presetSearches: [
        'Программист'
        'Менеджер по продажам'
        'Бухгалтер'
        'Менеджер по персоналу'
        'Водитель'
    ]

    actions:
        submit: () ->
            @set 'criteria.textArray', (item for item in @get('criteria.textArray') when item in @presetSearches)
            @set 'criteria.onlyWithSalary', false
            @set 'criteria.currency', @get('filter.defaultCurrency')
            @set 'criteria.specialization', []
            @set 'criteria.employment', []
            @set 'criteria.schedule', []

            @get('filter').send('submit')
