@ListPoller =
  poll: ->
    setTimeout @request, 5000
  
  request: ->
    $.get($('.list-container').data('url'))
  
  addList: (list) ->
    $('.list-container').html($(list))
    @poll()