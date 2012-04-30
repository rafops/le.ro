# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery
//= require jquery_ujs

jQuery ->
  HomeLib =
    'nform': jQuery('#new_shortening'),
    's_lab': jQuery('#new_shortening').find('label'),
    'sform': jQuery('#show_shortened'),
    's_url': jQuery('#shortening_url'),
    'r_url': jQuery('#root_url'),
    'd_url': jQuery('#shortened_url'),
    'paste': false

  if navigator.userAgent.indexOf('Mac') > 0
    jQuery('form').find('label').find('span').html('&#8984;')

  HomeLib['validate_url'] = (v) ->
    v = "" unless v?
    a = v.indexOf('://')
    b = v.indexOf('.')
    return a > 0 and b > 0 and b > a

  HomeLib['fix_url'] = (v) ->
    v = "" unless v?
    a = v.indexOf('://')
    b = v.indexOf('.')
    v = ("http://" + v) if b > 0 and a == -1
    return v

  HomeLib['s_url_is_valid'] = () ->
    HomeLib['validate_url'](HomeLib['s_url'].val())

  HomeLib['d_url_is_empty'] = () ->
    j = HomeLib['d_url'].val()
    return j.length == 0

  HomeLib['reset'] = () ->
    if HomeLib['sform'].is(':visible')
      HomeLib['sform'].fadeOut(100)
      HomeLib['nform'].fadeTo(100, 1.0)
    HomeLib['d_url'].val('')
    HomeLib['s_url'].val('').focus()
    HomeLib['paste'] = false

  HomeLib['reset']()

  HomeLib['nform'].bind 'submit', (e) ->
    return HomeLib['s_url_is_valid']() and HomeLib['d_url_is_empty']()

  HomeLib['s_url'].bind 'paste', (e) ->
    HomeLib['paste'] = true
    HomeLib['s_url'].val('')
  .bind 'keyup', (e) ->
    if HomeLib['paste'] == true
      HomeLib['nform'].submit()
    if e.keyCode == 13
      HomeLib['s_url'].val(HomeLib['fix_url'](HomeLib['s_url'].val()))
      HomeLib['nform'].submit()
  .bind 'blur', (e) ->
    if HomeLib['paste'] == false
      HomeLib['s_url'].val(HomeLib['fix_url'](HomeLib['s_url'].val()))
      HomeLib['nform'].submit()
  .bind 'click', (e) ->
    if HomeLib['d_url'].val().length > 0
      HomeLib['reset']()
    else
      jQuery(this).select()

  HomeLib['d_url'].bind 'click', (e) ->
    jQuery(this).select()
  .bind 'focus', (e) ->
    HomeLib['s_url'].focus() if HomeLib['d_url_is_empty']()

  jQuery('div.char_button').each (i,e) ->
    jQuery(this).click ->
      HomeLib['d_url'].val(HomeLib['d_url'].val() + jQuery(this).text())
      HomeLib['d_url'].focus().select()

  HomeLib['nform'].bind 'ajax:beforeSend', () ->
    HomeLib['nform'].fadeTo(100, 0.4)
  .bind 'ajax:success', (event, data, status, xhr) ->
    HomeLib['sform'].fadeIn(100)
    HomeLib['d_url'].val(HomeLib['r_url'].val() + data['s'])
    HomeLib['d_url'].focus().select()
  .bind 'ajax:error', () ->
    HomeLib['nform'].fadeTo(100, 1.0)
    HomeLib['d_url'].val('')
    HomeLib['flock'] = false
