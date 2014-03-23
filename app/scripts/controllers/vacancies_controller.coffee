VacancySearch.VacanciesController = Ember.Controller.extend

    totalFavourites: (->
        @get('favouriteVacancies').content.length
        ).property('favouriteVacancies.@each')
