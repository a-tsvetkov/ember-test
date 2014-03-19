VacancySearch.FilterController = Ember.Controller.extend
    needs: ['application']

    criteria: Ember.computed.alias('controllers.application.searchCriteria')
    dictionaries: Ember.computed.alias('controllers.application.dictionaries')
    defaultCurrency: Ember.computed.alias('controllers.application.defaultCurrency')

    actions:
        submit: () ->
            @get('criteria').save()
            @transitionToRoute('vacancies')
