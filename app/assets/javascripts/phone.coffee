# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(document).on 'change', '#sec_select', (evt) ->
    $.ajax 'update_depts',
      type: 'GET'
      dataType: 'script'
      data: {
        sec_id: $("#sec_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'change', '#dept_select', (evt) ->
    $.ajax 'update_sectors',
      type: 'GET'
      dataType: 'script'
      data: {
        dept_id: $("#dept_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

