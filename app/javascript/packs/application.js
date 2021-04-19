// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
console.log("application.js running");

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import { expandSidebar } from '../scripts/sidebar'
import { search } from '../scripts/search'
import { sharePopup, closeSharePopup } from '../scripts/show_share'
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  expandSidebar();
  search();
  sharePopup();
  closeSharePopup();

});


