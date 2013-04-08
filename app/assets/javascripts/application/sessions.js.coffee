$ ->
  $(document).on 'click', '#login', ->
    login_form = $(@).siblings('#login_form')
    $.get login_form.data('path'), (data) ->
      login_form.html data

  $(document).on 'click', '.close', ->
    $(@).parents('.container').remove()
