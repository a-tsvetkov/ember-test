VacancySearch.Router.map ->
    # Add your routes here
    @resource 'filter', ->
        @route('extended')
    @route 'vacancies'
    @route 'about'
