const createFirstFolder = () => {
  const addFirstFolder = document.getElementById('create-first-folder');
  if (addFirstFolder) {
    addFirstFolder.addEventListener('click', () => {
      console.log('addFirstFolder is clicked');
      document
        .getElementById('new-folder-form')
        .removeAttribute('class');
      const closeOnClick = document.getElementById('blocker');
      closeOnClick.removeAttribute('class', 'hidden')
    });
  }
};

const createFolder = () => {
  const addFolder = document.getElementById('create-folder');
  if (addFolder) {
    addFolder.addEventListener('click', () => {
      console.log('addFolder is clicked');
      document
        .getElementById('new-folder-form')
        .removeAttribute('class');
      const closeOnClick1 = document.getElementById('blocker-1');
      closeOnClick1.removeAttribute('class', 'hidden')
    });
  }
};

const closeCreateFolder = () => {
  const closeCreate = document.getElementById('close-create-folder')
  if (closeCreate) {
    closeCreate.addEventListener('click', () => {
      document
        .getElementById('new-folder-form')
        .setAttribute('class', 'hidden');
      const closeOnClick = document.getElementById('blocker');
      closeOnClick.setAttribute('class', 'hidden')
    });
  }
};

const closeCreateFolder1 = () => {
  const closeCreate = document.getElementById('close-create-folder')
  if (closeCreate) {
    closeCreate.addEventListener('click', () => {
      document
        .getElementById('new-folder-form')
        .setAttribute('class', 'hidden');
      const closeOnClick1 = document.getElementById('blocker-1');
      closeOnClick1.setAttribute('class', 'hidden')
    });
  }
};

// When I click somewhere else, it closes the add folder pop-up with no folder

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

// When I click somewhere else, it closes the add folder pop-up with folder

const closeFolderOnClick1 = (event) => {
  const closeOnClick1 = document.getElementById('blocker-1');
  if (closeOnClick1) {
    closeOnClick1.addEventListener('click', () => {
    document
      .getElementById('new-folder-form')
      .setAttribute('class', 'hidden')
      closeOnClick1.setAttribute('class', 'hidden')
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

export { createFirstFolder, createFolder, closeCreateFolder, closeFolderOnClick, closeFolderOnClick1, closeCreateFolder1 };
