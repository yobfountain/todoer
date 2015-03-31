//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on "page:change", ->
  if $('.list-container').length > 0
    ListPoller.poll()