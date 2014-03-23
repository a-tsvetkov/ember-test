VacancySearch.VacanciesRoute = Ember.Route.extend

    model: ->
        @store.find('favourite_vacancy')

    setupController: (controller, model) ->
        totalVacancies = @store.metadataFor('vacancy').found
        if totalVacancies
            controller.set 'totalVacancies', totalVacancies
        else
            controller.set 'totalVacancies', 0
        controller.set 'favouriteVacancies', model
