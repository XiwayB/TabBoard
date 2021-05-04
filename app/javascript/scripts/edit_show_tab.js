const editTabShow = () => {
    const showTabEdit = document.querySelectorAll("#tab-edit");
    if (showTabEdit.length) {
      console.log(showTabEdit)
      showTabEdit.forEach((tab) => {
        tab.addEventListener('click', (e) => {
          const currentTabId = e.currentTarget.dataset.id
          document.getElementById(`tab_update_${currentTabId}`).removeAttribute("class");
        })
      });
    }
}

const closeEditTabShow = () => {
  // console.log("closing share popup");
  const closeEditTabShow = document.querySelectorAll("#close-edit-tab-show");
  if (closeEditTabShow.length) {
    closeEditTabShow.forEach((close) => {
      close.addEventListener('click', (e) => {
        const closeCurrentTabId = e.currentTarget.dataset.id
        document.getElementById(`tab_update_${closeCurrentTabId}`).setAttribute("class", "hidden");
      });
    })
  }
}

export { editTabShow, closeEditTabShow }
