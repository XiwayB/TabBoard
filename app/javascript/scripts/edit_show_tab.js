const editTabShow = () => {
    const showTabEdit = document.querySelectorAll("#tab-edit");
    if (showTabEdit.length) {
      console.log(showTabEdit)
      showTabEdit.forEach((tab) => {
        tab.addEventListener('click', (e) => {
          console.log(e.currentTarget.dataset.id)
          document
            .getElementById("tab-update").removeAttribute("class");
        })
      });
      // showTabEdit.addEventListener('click', ()=>{
      //   console.log('showTabEdit is clicked')
      //   document.getElementById("tab-update").removeAttribute("class");
      // });
    }
}

const closeEditTabShow = () => {
  // console.log("closing share popup");
  const closeEditTabShow = document.querySelector("#close-edit-tab-show");
  if (closeEditTabShow) {
    closeEditTabShow.addEventListener('click', ()=>{
      document.getElementById("tab-update").setAttribute("class", "hidden");
    });
  }
}

export { editTabShow, closeEditTabShow }
