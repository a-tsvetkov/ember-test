VacancySearch.VacancyItemComponent = Ember.Component.extend
    tagName: 'div'
    classNames: ['row', 'vacancy']

    currency: (->
        code = @get('vacancy.salary.currency')
        if code?
            _.find(@get('currencies'), (item) -> item.code == code)
        ).property('vacancy.salary.currency', 'currencies.@each')

    isFavourite: (->
        if @get 'vacancy.isFavourite'
            return true
        if @get('favourites')?
            @get('vacancy.id') in @get('favourites').map((v) -> v.id)
        ).property('vacancy', 'favourites.@each')

    actions:
        toggleFavourite: () ->
            if @get 'isFavourite'
                @sendAction('removeAction', @get('vacancy'))
            else
                @sendAction('addAction', @get('vacancy'))
