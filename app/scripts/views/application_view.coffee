VacancySearch.ApplicationView = Ember.View.extend


    didInsertElement: () ->
        @fixMenuWidth()
        $(window).resize () => @fixMenuWidth()
        $('#menu nav').affix()

    fixMenuWidth: ->
        $('#menu nav').width($('#menu').width())
