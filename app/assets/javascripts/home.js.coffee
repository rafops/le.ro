# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#new_shortening').bind 'ajax:success', (event, data, status, xhr) ->
    alert "ok"
    true
  $('#new_shortening').bind 'ajax:error', () ->
    alert "er"
    false
