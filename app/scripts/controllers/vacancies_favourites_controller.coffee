VacancySearch.VacanciesFavouritesController = Ember.Controller.extend

    needs: ['application', 'vacancies']

    dictionaries: Ember.computed.alias('controllers.application.dictionaries')
    model: Ember.computed.alias('controllers.vacancies.favouriteVacancies')

    actions:
        removeFavourite: (vacancy) ->
            vacancy.destroyRecord()
