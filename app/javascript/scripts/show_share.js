const sharePopup = () => {
  console.log("share popping up");
    const showForm = document.getElementById("show-share-form");
    console.log({showForm})
    if (showForm) {
      showForm.addEventListener('click', ()=>{
        console.log('showForm is clicked')
        document.getElementById("new-share-form").removeAttribute("class");
      });
    }
}

const closeSharePopup = () => {
  console.log("closing share popup");
  const closeBtn = document.getElementById("close-share-form");
  if (closeBtn) {
    closeBtn.addEventListener('click', ()=>{
      document.getElementById("new-share-form").setAttribute("class", "hidden");
    });
  }
}





export { sharePopup, closeSharePopup }
