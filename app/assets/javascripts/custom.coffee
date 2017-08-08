$(document).on 'input', '.search-input', ->
  $.ajax "/bicycles.js?text=" + $(this).val(),
    type: 'GET'

$(document).on 'turbolinks:load', ->
  $('#bicycles .pagination').on 'click', 'a', ->
     $.getScript @href
