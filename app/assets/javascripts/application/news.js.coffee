$ ->
  $(document).on 'click', '#add_news', ->
    new_news_form = $(@).siblings('#new_news_form')
    $.get new_news_form.data('path'), (data) ->
      new_news_form.html data

  $(document).on 'submit', '#new_news', (event) ->
    event.preventDefault()
    news = $('#news')
    $(@).ajaxSubmit
      success: ->
        $('#new_news_form').html ''
        $.get news.data('path'), (data) ->
          news.html data

  $(document).on 'click', '.pagination a', (event) ->
    event.preventDefault()
    $.get $(@).attr('href'), (data) ->
      $('#news').html data

  $(document).on 'click', '.vote', (event) ->
    that = $(@)
    event.preventDefault()
    $.post that.attr('href'), (data) -> that.parents('.newska').html data

  $(document).on 'click', '.sort_news', (event) ->
    event.preventDefault()
    $.get $(@).attr('href'), (data) ->
      $('#news').html data

  $(document).on 'click', '.show_newska', ->
    $.get $(@).parents('.newska').data('path'), (data) ->
      $('#detailed_newska').html data
