VacancySearch.VacanciesIndexController = Ember.Controller.extend
    needs: ['application', 'vacancies']

    dictionaries: Ember.computed.alias('controllers.application.dictionaries')
    favouriteVacancies: Ember.computed.alias('controllers.vacancies.favouriteVacancies')

    sort: 'relevance'
    loading: false

    sortOptions: null

    sortKeys: (->
        _.map @get('sortOptions'), (item) => item.id
    ).property('sortOptions')

    actions:
        sort: (key) ->
            if key in @get 'sortKeys'
                @set 'sort', key
                return true

        loadNextPage: ->
            true unless @get 'loading'

        addFavourite: (vacancy) ->
            favourite = @store.createRecord 'favourite_vacancy', vacancy.toJSON(includeId: true)
            favourite.save()

        removeFavourite: (vacancy) ->
            favourite = @get('favouriteVacancies').find((v) -> v.get('id') == vacancy.get('id'))
            favourite.destroyRecord()
