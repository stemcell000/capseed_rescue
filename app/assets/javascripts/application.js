// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery-ui
//= require bootstrap-sprockets
//= require jquery_ujs
//= require autocomplete-rails
//= require jquery.remotipart
//= require select2
//= require bootstrap/bootstrap-rails-tooltip
//= require bootstrap/bootstrap-rails-popover
//= require jquery.tokeninput
//= require nprogress
//= require nprogress-turbolinks
//= require active_admin/select2
//= require update_assays_row_position
//= require update_productions_row_position
//= require jquery_nested_form
//= require smart_listing
//= require bootstrap-datepicker
//= require multi-select
//= require jasny-bootstrap.min
//= require custom
//= require_tree .


NProgress.configure({
  showSpinner: false,
  ease: 'ease',
  speed: 3,
  trickle: false
});

$(document).on('click', function() {
  NProgress.start();
});
$(document).on('render', function() {
  NProgress.done();
  NProgress.remove();
});

