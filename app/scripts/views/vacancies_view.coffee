VacancySearch.VacanciesView = Ember.View.extend

    didInsertElement: ->
        $(window).bind "scroll", () => @didScroll()

    willDestroyElement: -> $(window).unbind "scroll"

    isCloseToBottom: ->
        distanceToTop = $(document).height() - $(window).height()
        top = $(document).scrollTop()

        top == distanceToTop

    didScroll: ->
        if @isCloseToBottom()
            @get('controller').send 'loadNextPage'
