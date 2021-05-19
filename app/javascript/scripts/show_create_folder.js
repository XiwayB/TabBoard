const folderPopup = () => {
  console.log("folder popping up");
    const showForm = document.getElementById("show-folder-form");
    // console.log({showForm})
    if (showForm) {
      showForm.addEventListener('click', ()=>{
        // console.log('showForm is clicked')
        document.getElementById("new-folder-form").removeAttribute("class");
      });
    }
}

const closeFolderPopup = () => {
  // console.log("closing folder popup");
  const closeBtn = document.getElementById("close-folder-form");
  if (closeBtn) {
    closeBtn.addEventListener('click', ()=>{
      document.getElementById("new-folder-form").setAttribute("class", "hidden");
    });
  }
}





export { folderPopup, closeFolderPopup }
