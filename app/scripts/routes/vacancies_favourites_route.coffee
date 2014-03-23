VacancySearch.VacanciesFavouritesRoute = Ember.Route.extend

    model: ->
        @store.find('favourite_vacancy')
