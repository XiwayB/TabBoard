const favHeart = () => {
  const els = document.querySelectorAll("#fav-heart")
  if (els.length) {
    console.log({els})
    els.forEach((el) => {
      el.addEventListener('click', (e) => {
        // e.stopPropagation();
        // e.preventDefault();
        const id = e.currentTarget.dataset.id

        const url =  `/folders/${id}/like?format=json`
        // event.preventDefault();
        fetch(url)
        .then(response => response.json())
        .then((data) => {
          window.location.reload(true)


        })
        // on msg success, window.location.reload(true)
      })

    })
  }
}

const goToShow = () => {
  const cardEls = document.querySelectorAll("#folder-card")
  if (cardEls.length) {
    console.log({cardEls})
    cardEls.forEach((el) => {
      el.addEventListener('click', (e) => {
        // e.stopPropagation();
        // e.preventDefault();
        const id = e.currentTarget.dataset.id
        console.log({id})
        window.location.href = `/folders/${id}`
        // fetch to the route /folder/${id}/like?format=json
        // const url =  `http://taboard.herokuapp.com/folders/${id}/like?format=json`
        // event.preventDefault();

        // on msg success, window.location.reload(true)
      })

    })
  }
}

export { favHeart, goToShow }
