VacancySearch.ApplicationRoute = Ember.Route.extend
    # admittedly, this should be in IndexRoute and not in the
    # top level ApplicationRoute; we're in transition... :-)
    model: -> menuItems: [
        { route: 'filter', name: 'Настройки' }
        { route: 'vacancies', name: 'Вакансии' }
        { route: 'about', name: 'О приложении' }
    ]
