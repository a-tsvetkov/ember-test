Ember.Route.reopen
    render: (controller, model) ->
        @_super()
        # TODO: put this somewhere more appropriate
        window.scrollTo(0, 0);

VacancySearch.Router.reopen
    location: 'history'

VacancySearch.Router.map ->
    # Add your routes here
    @resource 'filter', ->
        @route('extended')
    @resource 'vacancies', ->
        @route 'favourites'
    @route 'about'
