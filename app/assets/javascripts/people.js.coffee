# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#people_birth_date_div").datepicker
    language: "br"
    format: "dd.mm.yyyy"
