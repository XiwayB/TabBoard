const toggleSearchContainer = () => {
  const searchBtn = document.getElementById('search-nav')
  // const searchBtn = document.getElementById('something-else')
  console.log({searchBtn})
  if (searchBtn) {
    console.log('inside search btn')

    searchBtn.addEventListener('click',(event)=>{
      event.preventDefault();
      console.log(12345)
      const searchContainer = document.getElementById('search-container')
      console.log({searchContainer})
      if (searchContainer) {
        searchContainer.style.display = 'block'
        // event.preventDefault();
      }

      // document.querySelector('.onButton').classList.toggle("show");
    });
  }

  const homeBut = document.querySelector('.home-but');
  if (homeBut) {
    document.querySelector('.home-but').addEventListener('click', (event) => {
      event.preventDefault();
      console.log('homebut')
      const searchContainer = document.getElementById('search-container')
      if (searchContainer) {
        searchContainer.style.display = 'none'

      }
    })
  }

}

export { toggleSearchContainer }
