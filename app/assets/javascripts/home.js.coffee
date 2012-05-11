# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(->
    $("a[rel='tooltip']").tooltip()
  )  
  $(->
    $('.dropdown-toggle').dropdown()
  )  
  $(->
    $('.dropdown-toggle').dropdown()
  )  
$( document).ready ->
  $("[countable]").charcounter
  limit: 140
  warning: 15
  warningClass: "label-warning"
  exceededClass: "label-important"
  defaultClass: "label-info"
  notAllowOverflow: true
  fontSize: "1.4em"
