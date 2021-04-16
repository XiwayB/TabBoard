// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import 'scripts/navbar';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  let sidebarBox = document.querySelector('#box-tabs');
  let sidebarBtn = document.querySelector('#btn-tabs');

  sidebarBtn.addEventListener('click', function(event) {

    if (this.classList.contains('active')) {
        this.classList.remove('active');
        sidebarBox.classList.remove('active');
    } else {
        this.classList.add('active');
        sidebarBox.classList.add('active');
    }
  });

  window.addEventListener('keydown', function(event) {

    if (sidebarBox.classList.contains('active') && event.keyCode === 27) {
        sidebarBtn.classList.remove('active');
        sidebarBox.classList.remove('active');
    }
  });
function select(element) {
  let selectData = element.textContent;
  inputBox.value = selectData;
  icon.onclick = () => {
    webLink = "https://www.google.com/search?q=" + selectData;
    linkTag.setAttribute("href", webLink);
    linkTag.click();
  }
  searchWrapper.classList.remove("active");
}

function showSuggestions(list) {
  let listData;
  if (!list.length) {
    let userValue = document.getElementById("search").value;
    listData = '<li>' + userValue + '</li>';
  } else {
    listData = list.join('');
  }
  suggBox.innerHTML = listData;
}

let suggestions = [
  'Channel',
  'CodingLab',
  'CodingNepal',
  'YouTube',
  'YouTuber',
  'YouTube Channel',
  'Blogger',
  'Bollywood',
  'Vlogger',
  'Vechiles',
  'Facebook',
  'Freelancer',
  'Facebook Page',
  'Designer',
  'Developer',
  'Web Designer',
  'Web Developer',
  'Login Form in HTML & CSS',
  'How to learn HTML & CSS',
  'How to learn JavaScript',
  'How to became Freelancer',
  'How to became Web Designer',
  'How to start Gaming Channel',
  'How to start YouTube Channel',
  'What does HTML stands for?',
  'What does CSS stands for?',
];

// getting all required elements
const searchWrapper = document.querySelector(".search-input");
const inputBox = document.querySelector("#search");
const suggBox = document.querySelector(".autocom-box");
const icon = document.querySelector(".fa");
let linkTag = document.querySelector("a");
let webLink;

// if user press any key and release
inputBox.onkeyup = (e) => {
  let userData = e.target.value; //user enetered data
  let emptyArray = [];
  if (userData) {
    icon.onclick = () => {
      webLink = "https://www.google.com/search?q=" + userData;
      linkTag.setAttribute("href", webLink);
      console.log(webLink);
      linkTag.click();
    }
    emptyArray = suggestions.filter((data) => {
      //filtering array value and user characters to lowercase and return only those words which are start with user enetered chars
      return data.toLocaleLowerCase().startsWith(userData.toLocaleLowerCase());
    });
    emptyArray = emptyArray.map((data) => {
      // passing return data inside li tag
      return data = '<li>' + data + '</li>';
    });
    searchWrapper.classList.add("active"); //show autocomplete box
    showSuggestions(emptyArray);
    let allList = suggBox.querySelectorAll("li");
    for (let i = 0; i < allList.length; i++) {
      //adding onclick attribute in all li tag
      allList[i].setAttribute("onclick", 'select(this)');
    }
  } else {
    searchWrapper.classList.remove("active"); //hide autocomplete box
  }
}

inputBox.onblur = function() {
  setTimeout(function() {
    searchWrapper.classList.remove('active');
  }, 300);
};


});
