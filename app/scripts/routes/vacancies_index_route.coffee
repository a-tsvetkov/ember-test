VacancySearch.VacanciesIndexRoute = Ember.Route.extend
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
            return Ember.RSVP.hash
                vacancies: @loadPage(@get 'page')
                favouriteVacancies: @store.find('favourite_vacancy')
        else
            return []

    setupController: (controller, model) ->
        controller.set 'model', model.vacancies
        controller.set 'favouriteVacancies', model.favouriteVacancies
        controller.set 'sortOptions', @getSortOptions()

    getSortOptions: ->
        availableOptions = @controllerFor('application').get('dictionaries.vacancy_search_order')
        _.filter(availableOptions, (option) => option.id in @get('allowedSorts')).reverse()

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
            @parseMeta()
            return data

    canLoadMore: ->
        @get('totalPages') > (@get('page') + 1)

    actions:
        loadNextPage: ->
            if @canLoadMore()
                @controller.set 'loading', true
                @loadPage(@get('page') + 1).then (data) =>
                    @controller.get('model').pushObjects(data.content)
                    @controller.set 'loading', false

        sort: (key) ->
            @loadPage(0).then (data) =>
                @controller.set 'model', data
