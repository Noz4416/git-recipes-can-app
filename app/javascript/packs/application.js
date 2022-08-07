// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import 'jquery';
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import '@fortawesome/fontawesome-free/js/all';
import "./scripts/main";

Rails.start();
Turbolinks.start();
ActiveStorage.start();


/*global $*/
let id = null;
// datalistのdata-id属性の値の取得
$("#js-text-field").on('change', function () {
  id = $("#arealist option[value='" + $(this).val() + "']").data('id');
});
