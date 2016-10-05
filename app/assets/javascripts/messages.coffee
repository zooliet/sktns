# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(document).on 'click', 'a.cancel', (e) ->
    e.preventDefault()
    $('form textarea').val("")
    $('div.new_message').slideUp()

  $(document).on 'click', 'a.new_message', (e) ->
    e.preventDefault()
    $('div.new_message').slideToggle()
    $('div.new_message').removeClass('hidden')

