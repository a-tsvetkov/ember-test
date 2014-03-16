VacancySearch.ApplicationRoute = Ember.Route.extend
    model: -> menuItems: [
        { route: 'filter', name: 'Настройки' }
        { route: 'vacancies', name: 'Вакансии' }
        { route: 'about', name: 'О приложении' }
    ]
