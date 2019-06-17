// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

// Boostrap 4 gem requirements
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// Cocoon gem requirement
//= require cocoon

//= require jquery.easing
//= require sb-admin-2

//= require Chart.bundle.min
// require demo/chart-area-demo
// require demo/chart-pie-demo

//= require datatables

//= require trix

//= require select2

//= require_tree .

$(document).on('turbolinks:load', function() {
  $( "select[data-searchable]" ).select2({
    theme: "bootstrap"
  });
});

