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
