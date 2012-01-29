# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#new_shortening').bind 'ajax:success', (event, data, status, xhr) ->
    $('#shortened_url').val($('#root_url').val() + data['s'])
    true
  $('#new_shortening').bind 'ajax:error', () ->
    $('#shortened_url').val('')
    false
