VacancySearch.VacanciesFavouritesController = Ember.Controller.extend

    needs: ['application']

    dictionaries: Ember.computed.alias('controllers.application.dictionaries')

    actions:
        removeFavourite: (vacancy) ->
            vacancy.destroyRecord()
