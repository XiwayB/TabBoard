const createFolder = () => {
  const addFolder = document.getElementById('create-folder');
  if (addFolder) {
    addFolder.addEventListener('click', () => {
      console.log('addFolder is clicked');
      document
        .getElementById('new-folder-form')
        .removeAttribute('class');
      const closeOnClick = document.getElementById('blocker');
      closeOnClick.removeAttribute('class', 'hidden')
    });
  }
};

const closeCreateFolder = () => {
  const closeCreate = document.getElementById('close-create-folder')
  if (closeCreate || closeOnClick) {
    closeCreate.addEventListener('click', () => {
      document
        .getElementById('new-folder-form')
        .setAttribute('class', 'hidden');
      const closeOnClick = document.getElementById('blocker');
      closeOnClick.setAttribute('class', 'hidden')
    });
  }
};

// When I click somewhere else, it closes the add folder pop-up

const closeFolderOnClick = (event) => {
  const closeOnClick = document.getElementById('blocker');
  if (closeOnClick) {
    closeOnClick.addEventListener('click', () => {
    document
      .getElementById('new-folder-form')
      .setAttribute('class', 'hidden')
    closeOnClick.setAttribute('class', 'hidden')
    });
  }
};

// If @folders.length < 1, this pop-up loading function executes
window.addEventListener('DOMContentLoaded', (event) => {
  document.getElementById('show-folder-form').removeAttribute('class');
  const loadFolderForm = document.getElementById('show-folder-form');
  // change id to be able to use above functions (open and close folder)
  loadFolderForm.id = 'new-folder-form';
});

export { createFolder, closeCreateFolder, closeFolderOnClick};
