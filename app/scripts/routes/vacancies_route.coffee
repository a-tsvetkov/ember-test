VacancySearch.VacanciesRoute = Ember.Route.extend
    page: 0
    totalPages: null
    perPage: 20

    allowedSorts: ['relevance', 'salary_desc']
    searchParams: null

    model: () ->
        @set 'page', 0
        criteria = @controllerFor('application').get('searchCriteria')
        if criteria.hasSearchParams()
            @set 'searchParams', criteria.searchParams()
            return @loadPage(@get 'page')
        else
            return []

    afterModel: (vacancies) ->
        @parseMeta()

    setupController: (controller, model) ->
        controller.set 'model', model

        controller.set 'sortOptions', @getSortOptions()

    getSortOptions: ->
        sortOptions = []
        availableOptions = @controllerFor('application').get('dictionaries.vacancy_search_order')
        for option in availableOptions
            if option.id in @get('allowedSorts')
                sortOptions.push option

        sortOptions.reverse()

    parseMeta: ->
        meta = @store.metadataFor('vacancy')
        @set 'page', meta.page
        @set 'totalPages', meta.pages

    loadPage: (page) ->
        params = @get 'searchParams'
        params.page = page
        params.per_page = @get 'perPage'
        if @controller? and @controller.get 'sort'
            params.order_by = @controller.get 'sort'

        @store.find('vacancy', params).then (data) =>
            currencies = @controllerFor('application').get('dictionaries.currency')
            for item in data.content
                if item.get 'salary'
                    item.set 'currency', _.find currencies, (c) -> c.code == item.get 'salary.currency'

            return data


    canLoadMore: ->
        @get('totalPages') > (@get('page') + 1)

    actions:
        loadNextPage: ->
            if @canLoadMore()
                @controller.set 'loading', true
                @loadPage(@get('page') + 1).then (data) =>
                    items = @controller.get 'model'
                    items.pushObjects(data.content)
                    @parseMeta()
                    @controller.set 'loading', false

        sort: (key) ->
            @loadPage(0).then (data) =>
                @controller.set 'model', data
