VacancySearch.ApplicationAdapter = DS.RESTAdapter.extend
    host: "https://api.hh.ru"

VacancySearch.ApplicationSerializer = DS.RESTSerializer.extend
    keyForAttribute: (attr) ->
        Ember.String.underscore attr

VacancySearch.VacancySerializer = VacancySearch.ApplicationSerializer.extend
    extractArray: (store, type, payload, requestType) ->
        payload.vacancy = payload.items
        delete payload.items

        @_super(store, type, payload, requestType)

    extractMeta: (store, type, payload) ->
        if payload?
            meta =
                found: payload.found
                pages: payload.pages
                page: payload.page
                perPage: payload.per_page

            delete payload.found
            delete payload.pages
            delete payload.page
            delete payload.per_page

            store.metaForType(type, meta)
