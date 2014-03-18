Ember.Route.reopen
    render: (controller, model) ->
        @_super()
        # TODO: put this somwhere more appropriate
        window.scrollTo(0, 0);

VacancySearch.Router.map ->
    # Add your routes here
    @resource 'filter', ->
        @route('extended')
    @route 'vacancies'
    @route 'about'
