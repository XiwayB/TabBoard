// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
console.log('application.js running');

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('channels');

import 'bootstrap';
import '../stylesheets/application.scss';
import {
  expandSidebar,
  showFolderForm,
  keepSidebarOpen,
} from '../scripts/sidebar';
// import { showFolderForm } from '../scripts/show_sidebar_folder'
import { initChoices } from '../scripts/init-choices';
// drag and drop

import { uniqueDropzone } from '../scripts/init-draggable'
import { search } from '../scripts/search'
import { favHeart, goToShow } from '../scripts/fav-heart'
import { toggleSearchContainer } from '../scripts/toggle-search-container'
import { sharePopup, closeSharePopup } from '../scripts/show_share'
import { folderPopup, closeFolderPopup } from '../scripts/show_create_folder'
import { editFolder, closeEditFolder } from '../scripts/edit_folder'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  expandSidebar();
  search();
  sharePopup();
  closeSharePopup();
  folderPopup();
  closeFolderPopup();
  initChoices();
  // draggable function
  uniqueDropzone();
  // keepSidebarOpen();
  showFolderForm();
  toggleSearchContainer();
  editFolder();
  closeEditFolder();
  favHeart();
  goToShow();
});
