VacancySearch.VacanciesView = Ember.View.extend

    didInsertElement: ->
        @scrollCallback = () => @didScroll()
        $(window).bind "scroll", @scrollCallback

    willDestroyElement: -> $(window).unbind "scroll", @scrollCallback

    isCloseToBottom: ->
        distanceToTop = $(document).height() - $(window).height()
        top = $(document).scrollTop()

        top == distanceToTop

    didScroll: ->
        if @isCloseToBottom()
            @get('controller').send 'loadNextPage'
