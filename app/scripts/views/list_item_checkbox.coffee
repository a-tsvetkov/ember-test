VacancySearch.ListItemCheckbox = Ember.Checkbox.extend

    value: null

    checked: ((key, newValue) ->
        if not $.isArray(@get('items'))
            return

        if newValue?
            if newValue is true
                @get('items').pushObject(@get('value'))
            else
                @get('items').removeObject(@get('value'))

        @get('value') in @get('items')
        ).property('items.@each')
