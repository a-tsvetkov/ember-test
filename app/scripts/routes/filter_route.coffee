VacancySearch.FilterRoute = Ember.Route.extend
    model: -> Ember.RSVP.hash
        areas: $.getJSON('https://api.hh.ru/areas').then((data) ->
            getChildAreas = (item) ->
                if $.isArray(item.areas) and item.areas.length > 0 then $.map(item.areas, getChildAreas) else item

            flattened = []
            for country in data
                for area in $.map(country.areas, getChildAreas)
                    area.group = country.name
                    flattened.push area

            flattened
        )
        specializations: $.getJSON('https://api.hh.ru/specializations').then (data) ->
            data.sort (a, b) -> Number(a.id) - Number(b.id)

    afterModel: (model) ->
        if @controllerFor('application').get('searchCriteria.extended')
            @transitionTo('filter.extended')

    setupController: (controller, model) ->
        controller.set('areas', model.areas)
        controller.set('specializations', model.specializations)
