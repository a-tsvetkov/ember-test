VacancySearch.VacanciesRoute = Ember.Route.extend

    model: ->
        @store.find('favourite_vacancy')

    setupController: (controller, model) ->
        controller.set 'totalVacancies', @store.metadataFor('vacancy').found
        controller.set 'favouriteVacancies', model
