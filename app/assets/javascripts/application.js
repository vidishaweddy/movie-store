// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require jquery.turbolinks
//= require foundation
//= require turbolinks
//= require_tree .
//= require select2
//= require select2_simple_form
//= require nested_form_fields
//= require bootstrap-datepicker

var ready = function() {
  $(".select2").select2();
};

var dataTable = function() {
  $('#admin-table').dataTable();
}

$(function(){
  $(document).foundation();
  $(".alert" ).fadeOut(5);
});
$(document).on('ready turbolinks:load', ready);
$(document).on('dataTable turbolinks:load', dataTable);
$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "dd M yyyy", "weekStart": 1, "autoclose": true, "endDate": "0"})
});