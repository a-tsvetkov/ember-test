VacancySearch.ApplicationAdapter = DS.RESTAdapter.extend
    host: "https://api.hh.ru"

VacancySearch.ApplicationSerializer = DS.RESTSerializer.extend
    keyForAttribute: (attr) ->
        Ember.String.underscore attr

    extractArray: (store, type, payload, requestType) ->
        cleaned_payload = {}
        cleaned_payload[type.typeKey] = payload.items

        @_super(store, type, cleaned_payload, requestType)

VacancySearch.VacancySerializer = VacancySearch.ApplicationSerializer.extend

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

VacancySearch.FilterSerializer = DS.LSSerializer
VacancySearch.FilterAdapter = DS.LSAdapter.extend
    namespace: 'hh-vacancy'

VacancySearch.FavouriteVacancySerializer = DS.LSSerializer
VacancySearch.FavouriteVacancyAdapter = DS.LSAdapter.extend
    namespace: 'hh-vacancy'
