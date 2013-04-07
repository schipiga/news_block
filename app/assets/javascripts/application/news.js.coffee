$ ->
  $(document).on 'click', '#add_news', (event) ->
    event.preventDefault()
    $.get $(@).attr('href'), (data) ->
      $('#show_news_form').html data

  $(document).on 'submit', '.news_form', (event) ->
    event.preventDefault()
    news = $('#news')
    $(@).ajaxSubmit
      success: ->
        $('#show_news_form').html ''
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

  $(document).on 'click', '.edit_news', (event) ->
    event.preventDefault()
    $.get $(@).attr('href'), (data) ->
      $('#show_news_form').html data
