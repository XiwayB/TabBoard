const editTabShow = () => {
  // console.log("share popping up");
    const showTabEdit = document.getElementById("tab-edit");
    // console.log({showForm})
    if (showTabEdit) {
      showTabEdit.addEventListener('click', ()=>{
        console.log('showTabEdit is clicked')
        document.getElementById("tab-update").removeAttribute("class");
      });
    }
}

const closeEditTabShow = () => {
  // console.log("closing share popup");
  const closeEditTabShow = document.getElementById("close-edit-tab-show");
  if (closeEditTabShow) {
    closeEditTabShow.addEventListener('click', ()=>{
      document.getElementById("tab-update").setAttribute("class", "hidden");
    });
  }
}

export { editTabShow, closeEditTabShow }
