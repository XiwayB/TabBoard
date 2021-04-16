const search = () => {


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
  const inputBox = document.getElementById("search");
  const suggBox = document.querySelector(".autocom-box");
  const icon = document.querySelector(".fa");
  let linkTag = document.querySelector("a");
  let webLink;

  // if user press any key and release
  inputBox.onkeyup = (e) => {
    console.log(1234)
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
      showSuggestions(emptyArray, suggBox);
      let allList = suggBox.querySelectorAll("li");
      for (let i = 0; i < allList.length; i++) {
        //adding onclick attribute in all li tag
        // allList[i].setAttribute("onclick", 'select(this)');
        allList[i].setAttribute("id", 'search_select');
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
}



const showSuggestions = (list, suggBox) => {
  let listData;
  if (!list.length) {
    let userValue = document.getElementById("search").value;
    listData = '<li>' + userValue + '</li>';
  } else {
    listData = list.join('');
  }
  suggBox.innerHTML = listData;
}

const select = () => {
  const el = document.getElementById("search_select")
  console.log({el})
  if (el) {
    el.addEventListener('click', e => {
      console.log(567, e)
    })
  }
  const inputBox = document.getElementById("search");
  // let selectData = element.textContent;
  // inputBox.value = selectData;
  // icon.onclick = () => {
  //   webLink = "https://www.google.com/search?q=" + selectData;
  //   linkTag.setAttribute("href", webLink);
  //   linkTag.click();
  // }
  // searchWrapper.classList.remove("active");
}

// const select = (element) => {
//   const inputBox = document.getElementById("search");
//   console.log('el', element)
//   let selectData = element.textContent;
//   inputBox.value = selectData;
//   icon.onclick = () => {
//     webLink = "https://www.google.com/search?q=" + selectData;
//     linkTag.setAttribute("href", webLink);
//     linkTag.click();
//   }
//   searchWrapper.classList.remove("active");
// }

export { search, select }
