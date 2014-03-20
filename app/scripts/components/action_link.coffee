VacancySearch.ActionLinkComponent = Ember.Component.extend
    tagName: 'span'
    classNameBindings: ['isActive:active']

    isActive: (->
        @get('key') == @get('currentActive')
    ).property('key', 'currentActive')

    actions:
        click: () ->
            @sendAction('action', @get('key'))
