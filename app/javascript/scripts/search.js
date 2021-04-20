// getting all required elements
const searchWrapper = document.querySelector(".search-input");
const inputBox = document.getElementById("search");
const results = document.querySelector("#results");
const suggBox = document.querySelector(".autocom-box");
const icon = document.querySelector(".fa");
let linkTag = document.querySelector("a");
let webLink;



const search = () => {
  inputBox.onkeyup = (e) => {
    console.log(1234)
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    const url =  `http://localhost:3000/tabs?format=json&query=${userData}`
    if(userData) {
      fetch(url).then(response => response.json())
      .then((data) => {
        console.log(123, data)
        results.innerHTML = '';
        let listString = ''
        data.forEach((result) => {
          console.log(result)
          const list = `
          <li onclick="select(this)" data-folder-id="${result.folder_id}">
          <p>${result.title} | ${result.url} </p>
          <button type="submit">${result.folder.name}</button>
          </li>`
          listString += list
          })
          console.log('listString:', listString)
          let tabs = results.innerHTML = listString
          searchWrapper.classList.add("active"); //show autocomplete box
          // showSuggestions(tabs, suggBox);
          // let allList = suggBox.querySelectorAll("li");
          // for (let i = 0; i < allList.length; i++) {
          //   //adding onclick attribute in all li tag
            // allList[i].setAttribute("onclick", 'select(this)');
          //   allList[i].setAttribute("data-folder-id", result.folder_id);
          //   // allList[i].setAttribute("id", 'search_select');
          // };
        })
      } else {
        searchWrapper.classList.remove("active")
      };


  }
}





// icon.onclick = () => {
//   webLink = "https://www.google.com/search?q=" + userData;
//   linkTag.setAttribute("href", webLink);
//   console.log(webLink);
//   linkTag.click();
// }




// inputBox.onblur = function() {
//   setTimeout(function() {
//     searchWrapper.classList.remove('active');
//   }, 300);
// };




export { search }
