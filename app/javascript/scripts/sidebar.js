

const expandSidebar = () => {
  let sidebarBox = document.querySelector('#box-tabs');
    let sidebarBtn = document.querySelector('#btn-tabs');

    if (sidebarBtn) {
      sidebarBtn.addEventListener('click', function(event) {

        if (this.classList.contains('active')) {
            this.classList.remove('active');
            sidebarBox.classList.remove('active');
        } else {
            this.classList.add('active');
            sidebarBox.classList.add('active');
        }
      });

      window.addEventListener('keydown', function(event) {

        if (sidebarBox.classList.contains('active') && event.keyCode === 27) {
            sidebarBtn.classList.remove('active');
            sidebarBox.classList.remove('active');
        }
      });
    }


}


const showFolderForm = () => {
  console.log('hi')
  let addFolderButtons = document.querySelectorAll('#add_to_folder')
  console.log({addFolderButtons})

  if (addFolderButtons.length) {
    addFolderButtons.forEach(btn => {
      btn.addEventListener('click', e => {
        console.log(123, e.currentTarget)
        console.log(434, e.currentTarget.dataset.id)
        const tabId = e.currentTarget.dataset.id
        document.getElementById(`add_folder_form_${tabId}`).classList.toggle('hidden2')
      })
    })
  }
  // let folderForm = document.getElementById('add_folder_form')
  // console.log({folderForm})

  // const test = document.getElementById('test-button')

  // if (addFolderButton) {
  //   addFolderButton.addEventListener('click', () => {
  //     console.log(1234)
  //     folderForm.classList.toggle('hidden2');
  //   })
  // }
}

export { expandSidebar, showFolderForm }

