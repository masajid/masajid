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
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap
//= require rails.validations
//= require rails.validations.simple_form.bootstrap4
//= require noty/noty
//= require social-share-button
//= require_tree .

$(function() {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('open')
  })

  $('.locale-selector select').change(function() {
    this.form.submit();
  });
});

function noty(type, dir, text) {
  let layout = 'topRight'

  if (dir === 'rtl') {
    layout = 'topLeft'
  }

  new Noty({
    theme: 'bootstrap-v4',
    timeout: 8000,
    type: type,
    layout: layout,
    text: text
  }).show();
};
