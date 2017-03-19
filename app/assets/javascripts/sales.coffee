# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#sale_item_name').autocomplete
  source: $('#sale_item_name').data('autocomplete-source')
