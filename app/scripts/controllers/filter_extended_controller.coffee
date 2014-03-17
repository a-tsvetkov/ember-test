VacancySearch.FilterExtendedController = Ember.Controller.extend
    needs: ['filter']
    filter: Ember.computed.alias('controllers.filter')

    specializationLimit: 5
    specializationsExpanded: false

    shortSpecializations: (->
        @get('filter.specializations')[0..5]
        ).property('filter.specializations')

    actions:
        toggleSpecializations: -> @set 'specializationsExpanded', not @get('specializationsExpanded')
        setText: (value) -> @set('filter.text', value)
