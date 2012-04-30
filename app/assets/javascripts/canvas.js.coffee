# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery
//= require jquery_ujs

jQuery ->
  CanvasLib =
    'iframe': jQuery('iframe'),
    'tool': jQuery('#tool')

  CanvasLib['tool'].click () ->
    console.log(CanvasLib['iframe'].contents())
