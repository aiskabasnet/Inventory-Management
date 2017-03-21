$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  row = $(this).closest('tr')
  value = $('.total',row)
  dis = $('.discount')
  vat = $('.vat')
  discount= parseFloat(dis.val())
  data = parseFloat(value.val())
  ###$('.discount').val('0');###
  grandtotal = $('.total-cost')
  grand_value = parseFloat(grandtotal.val())
  if (( grand_value - data) <= 0)
    grandtotal.val('0')
    dis.val('0')

    $('.grand-total').val('0')
    vat.val('0')
  else
    grandtotal.val(( (grand_value - data)).toFixed(2))

    $('.grand-total').val((( parseFloat($('.total-cost').val()) )-parseFloat($('.discount').val())).toFixed(2))
    totalvalue = parseFloat($('.grand-total').val())
    $('.vat').val((totalvalue+ vatp/100 * totalvalue).toFixed(2))

  row.remove()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
#  count += 1
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'),'g')
  $('.add-data').append($(this).data('fields').replace(regexp, time))
  $('.select-item').select2()


  event.preventDefault()
