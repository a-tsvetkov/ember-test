VacancySearch.VacanciesRoute = Ember.Route.extend
    page: 0
    totalPages: null
    perPage: 20

    model: ->
        @set 'page', 0
        criteria = @controllerFor('application').get('searchCriteria')
        if criteria.hasSearchParams()
            return @loadPage(criteria, @get 'page')
        else
            return []

    afterModel: (vacancies) ->
        @parseMeta()

    parseMeta: ->
        meta = @store.metadataFor('vacancy')
        @set 'page', meta.page
        @set 'totalPages', meta.pages


    loadPage: (criteria, page) ->
        params = criteria.searchParams()
        params.page = page
        params.per_page = @get 'perPage'
        @store.find('vacancy', params)

    canLoadMore: ->
        @get('totalPages') > (@get('page') + 1)

    actions:
        loadNextPage: ->
            if @canLoadMore()
                criteria = @controllerFor('application').get('searchCriteria')
                @loadPage(criteria, @get('page') + 1).then (data) =>
                    items = @modelFor 'vacancies'
                    items.pushObjects(data.content)
                    @parseMeta()
