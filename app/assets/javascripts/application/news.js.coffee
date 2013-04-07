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
