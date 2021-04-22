const createFolder = () => {
  console.log("share popping up");
    const addFolder = document.getElementById("create-folder");
    // console.log({showForm})
    if (addFolder) {
      addFolder.addEventListener('click', ()=>{
        console.log('addFolder is clicked')
        document.getElementById("new-folder-form").removeAttribute("class");
      });
    }
}

const closeCreateFolder = () => {
  // console.log("closing share popup");
  const closeCreate = document.getElementById("close-create-folder");
  if (closeCreate) {
    closeCreate.addEventListener('click', ()=>{
      document.getElementById("new-folder-form").setAttribute("class", "hidden");
    });
  }
}

export { createFolder, closeCreateFolder }
