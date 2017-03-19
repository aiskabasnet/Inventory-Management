jQuery ->
  $('#sale_item_name').autocomplete
  source: $('#sale_item_name').data('autocomplete-source')