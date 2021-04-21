// getting all required elements
const searchWrapper = document.querySelector(".search-input");
const inputBox = document.getElementById("search");
const results = document.querySelector("#results");
const suggBox = document.querySelector(".autocom-box");
const icon = document.querySelector(".fa");
let linkTag = document.querySelector("a");
let webLink;



const search = () => {
  if (inputBox) {
   inputBox.onkeyup = (e) => {
    console.log("eee",e)
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    console.log("target", e.target)
    const url =  `http://localhost:3000/tabs?format=json&query=${userData}`
    const folderUrl = `http://localhost:3000/folders`
    if(userData) {
      fetch(url).then(response => response.json())
      .then((data) => {
        // console.log(123, data)
        results.innerHTML = '';
        let listString = ''
        data.forEach((result) => {

          // console.log(result)

          let url = result.url.includes("http") ? result.url : `https://${result.url}`

          const list = `
          <li onclick="select(this)" data-folder-id="${result.folder_id}">
          ${result.title} | <a rel="stylesheet" target="_blank" href="${url}">${url}</a>
          <i class="fas fa-folder-plus mx-2" style="color: white;"></i>
          <a rel="stylesheet" href="${folderUrl}/${result.folder.id}">${result.folder.name}</a>
          </li>`
          listString += list
          })

          let tabs = results.innerHTML = listString
          searchWrapper.classList.add("active"); //show autocomplete box
        })
      } else {
        searchWrapper.classList.remove("active")
      };


  }
  }

}





// inputBox.onblur = function() {
//   setTimeout(function() {
//     searchWrapper.classList.remove('active');
//   }, 300);
// };




export { search }
