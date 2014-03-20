VacancySearch.VacanciesController = Ember.Controller.extend
    needs: ['application']

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
