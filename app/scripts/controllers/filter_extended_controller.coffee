VacancySearch.FilterExtendedController = Ember.Controller.extend
    needs: ['filter']
    filter: Ember.computed.alias('controllers.filter')
    criteria: Ember.computed.alias('controllers.filter.criteria')

    specializationLimit: 5
    specializationsExpanded: false

    shortSpecializations: (->
        @get('filter.specializations')[0..5]
        ).property('filter.specializations')

    actions:
        toggleSpecializations: -> @set 'specializationsExpanded', not @get('specializationsExpanded')
        setText: (value) -> @set('criteria.text', value)
        submit: () -> @get('filter').send('submit')
