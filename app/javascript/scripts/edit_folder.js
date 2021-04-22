const editFolder = () => {
  // console.log("share popping up");
    const showEdit = document.getElementById("edit-folder");
    // console.log({showForm})
    if (showEdit) {
      showEdit.addEventListener('click', ()=>{
        console.log('showEdit is clicked')
        document.getElementById("show-edit-folder").removeAttribute("class");
      });
    }
}

const closeEditFolder = () => {
  // console.log("closing share popup");
  const closeEdit = document.getElementById("close-edit-folder");
  if (closeEdit) {
    closeEdit.addEventListener('click', ()=>{
      document.getElementById("show-edit-folder").setAttribute("class", "hidden");
    });
  }
}

export { editFolder, closeEditFolder }
