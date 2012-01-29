# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  HomeLib =
    'sform': jQuery('#new_shortening'),
    's_url': jQuery('#shortening_url'),
    'r_url': jQuery('#root_url'),
    'd_url': jQuery('#shortened_url'),
    'flock': false

  console = {} unless console
  unless console.log
    console.log = () ->
      return false

  HomeLib['s_url_is_valid'] = () ->
    j = HomeLib['s_url'].val()
    console.log 's_url = ' + j
    return true if j.indexOf('://') > 0 and j.indexOf('.') > 0

  HomeLib['d_url_is_empty'] = () ->
    j = HomeLib['d_url'].val()
    console.log 'd_url = ' + j
    return true if j.length == 0

  HomeLib['fsend'] = () ->
    console.log 'fsend...'
    HomeLib['sform'].submit() if HomeLib['s_url_is_valid']() and HomeLib['d_url_is_empty']()

  HomeLib['s_url'].val('')
  HomeLib['d_url'].val('')
  HomeLib['s_url'].focus()

  HomeLib['s_url'].bind 'keyup', (e) ->
    console.log 'keyup...'
    return false if HomeLib['flock'] == true
    k_code = if e.keyCode then e.keyCode else e.charCode
    console.log 'k_code = ' + k_code
    HomeLib['fsend']() if HomeLib['d_url_is_empty']() && (k_code==17 || k_code==224)

  HomeLib['s_url'].bind 'blur', (e) ->
    console.log 'blur...'
    return false if HomeLib['flock'] == true
    HomeLib['fsend']() if HomeLib['d_url_is_empty']()

  HomeLib['s_url'].bind 'change', (e) ->
    console.log 'change...'
    HomeLib['d_url'].val('') unless HomeLib['flock'] == true

  HomeLib['sform'].bind 'ajax:beforeSend', () ->
    console.log 'ajax:beforeSend...'
    HomeLib['flock'] = true

  HomeLib['sform'].bind 'ajax:success', (event, data, status, xhr) ->
    console.log 'ajax:success...'
    HomeLib['d_url'].val(HomeLib['r_url'].val() + data['s'])
    HomeLib['d_url'].focus().select()
    HomeLib['flock'] = false
    true
  .bind 'ajax:error', () ->
    console.log 'ajax:error...'
    HomeLib['d_url'].val('')
    HomeLib['flock'] = false
    false
