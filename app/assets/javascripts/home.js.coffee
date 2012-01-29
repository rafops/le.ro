# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  HomeLib =
    'sform': jQuery('#new_shortening'),
    's_url': jQuery('#shortening_url'),
    'r_url': jQuery('#root_url'),
    'd_url': jQuery('#shortened_url')

  HomeLib['s_url_is_valid'] = () ->
    j = HomeLib['s_url'].val()
    return j.indexOf('://') > 0 and j.indexOf('.') > 0

  HomeLib['d_url_is_empty'] = () ->
    j = HomeLib['d_url'].val()
    return j.length == 0

  HomeLib['d_url'].val('').attr('maxlength', 0)
  HomeLib['s_url'].val('').focus().attr('maxlength', 0)

  HomeLib['sform'].bind 'submit', (e) ->
    return HomeLib['s_url_is_valid']() and HomeLib['d_url_is_empty']()

  HomeLib['s_url'].bind 'paste', (e) ->
    jQuery(this).removeAttr('maxlength')
  .bind 'keyup', (e) ->
    jQuery(this).attr('maxlength', 0)
    HomeLib['sform'].submit()
  .bind 'click', (e) ->
    jQuery(this).select()

  HomeLib['d_url'].bind 'click', (e) ->
    jQuery(this).select()
  .bind 'focus', (e) ->
    HomeLib['s_url'].focus() if HomeLib['d_url_is_empty']()

  HomeLib['sform'].bind 'ajax:success', (event, data, status, xhr) ->
    HomeLib['d_url'].val(HomeLib['r_url'].val() + data['s'])
    HomeLib['d_url'].focus().select()
  .bind 'ajax:error', () ->
    HomeLib['d_url'].val('')
    HomeLib['flock'] = false
