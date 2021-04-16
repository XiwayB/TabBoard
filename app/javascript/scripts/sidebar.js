

const expandSidebar = () => {
  let sidebarBox = document.querySelector('#box-tabs');
    let sidebarBtn = document.querySelector('#btn-tabs');

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

export { expandSidebar }
