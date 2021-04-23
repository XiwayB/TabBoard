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
    // console.log("eee",e)
    let userData = e.target.value; //user enetered data
    let emptyArray = [];
    // console.log("target", e.target)
    const url =  `/tabs?format=json&query=${userData}`
    const folderUrl = `/folders`
    if(userData) {
      fetch(url).then(response => response.json())
      .then((data) => {
        // console.log(123, data)
        results.innerHTML = '';
        let listString = '<li style="font-size: 36px; font-weight: 500; margin-top: 20px; fontcolour: white">Search Results:</li>'
        data.forEach((result, index) => {

          // console.log(result)

          let url = result.url.includes("http") ? result.url : `https://${result.url}`

          const list = `

          <li onclick="select(this)" data-index="${index}" data-folder-id="${result.folder_id}">

            <div style="display: flex; align-items: center;">
              <div style="width: 80%">
                <span style="font-weight: medium; font-size: 1.2em">${result.title}</span><br>
                <a style="word-break: break-all;" target="_blank" href="${url}">${url}</a>
              </div>
            <div style="">
              <a onMouseOver="this.style.background='white', this.style.color='black'" onMouseOut="this.style.background='black', this.style.color='white'" style=" height: 37px; padding: 4px 18px; border-radius: 20px; border: 2.7px solid white; margin-left: 30px; font-family: 'Poppins', sans-serif; font-weight: medium;" rel="stylesheet" href="${folderUrl}/${result.folder.id}">
                ${result.folder.name}
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
