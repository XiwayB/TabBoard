// getting all required elements
const searchWrapper = document.querySelector(".search-input");
const inputBox = document.getElementById("search");
const results = document.querySelector("#results");
const suggBox = document.querySelector(".autocom-box");
const icon = document.querySelector(".fa");
let linkTag = document.querySelector("a");
let webLink;



const search = () => {
  // console.log(12345678901234567890)
  if (inputBox) {
    // console.log({inputBox})
   // inputBox.onkeyup = (e) => {
   inputBox.addEventListener('keydown', (e) => {
    // results.innerHTML = `<h2 style="font-size: 40px; color: #FFF;">LOADING...</h2>`
    results.innerHTML = `<div class="loading-container"><img src="https://res.cloudinary.com/dztwrgpbi/image/upload/v1619166897/Spinner-1s-400px.svg" width="150"></div>`
    // console.log("eee",e)
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    // console.log("target", e.target)
    const url =  `/tabs?format=json&query=${userData}`
    
    const folderUrl = `/folders`
    if(userData) {

      fetch(url).then(response => response.json())
      .then((data) => {
        console.log(123, data)
        results.innerHTML = '';
        let listString = '<li style="font-size: 36px; font-weight: 500; margin-top: 20px; fontcolour: white">Search Results:</li>'
        data.forEach((result, index) => {

          // console.log(result)

          let url = result.url.includes("http") ? result.url : `https://${result.url}`
          let shortUrl = () => {
            if (url.length > 125) {
              return url.substring(0, 100) + "...";
            } else {
              return url
            }
          }
          let shortTitle = () => {
            if (result.title.length > 100) {
              return result.title.substring(0, 100) + "...";
            } else {
              return result.title
            }
          }
          const list = `

          <li onclick="select(this)" data-index="${index}" data-folder-id="${result.folder_id}">

            <div style="display: flex; align-items: center;">
              <div class="search-result-title-section">
                <span style="font-weight: medium; font-size: 1.2em">${shortTitle()}</span><br>
                <a style="word-break: break-all;" target="_blank" href="${url}">${shortUrl()}</a>
              </div>
            <div class="search-result-folder-section">
                <a rel="stylesheet" href="${folderUrl}/${result.folder.id}">
                 <div class="search-result-folder-btn">${result.folder.name}</div>
                </a>
            </div>
          </li>`

          listString += list
          })

          let tabs = results.innerHTML = listString
          searchWrapper.classList.add("active"); //show autocomplete box
        })
      } else {
        searchWrapper.classList.remove("active")
      };


    })
  }

}

// inputBox.onblur = function() {
//   setTimeout(function() {
//     searchWrapper.classList.remove('active');
//   }, 300);
// };




export { search }
