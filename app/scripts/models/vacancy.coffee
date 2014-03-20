VacancySearch.Vacancy = DS.Model.extend
    name: DS.attr('string')
    premium: DS.attr('boolean')
    address: DS.attr()
    salary: DS.attr()
    currency: DS.attr('string', defaultValue: '')
    url: DS.attr('string')
    createdAt: DS.attr('date')
    publishedAt: DS.attr('date')
    employer: DS.attr()
    alternateUrl: DS.attr('string')
    type: DS.attr()
    url: DS.attr('string')
    responseLetterRequired: DS.attr('boolean')
