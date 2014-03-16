VacancySearch.FilterIndexController = Ember.Controller.extend
    needs: ['filter']
    filter: Ember.computed.alias('controllers.filter')
