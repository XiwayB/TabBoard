import {Droppable} from '@shopify/draggable';

const uniqueDropzone = () => {
  console.log(`hello from draggable`)
  const containers = document.querySelectorAll('#UniqueDropzone .BlockLayout');
  console.log({containers})


  if (containers.length === 0) {
    return false;
  }

  const droppable = new Droppable(containers, {
    draggable: '.Block--isDraggable',
    dropzone: '.BlockWrapper--isDropzone',
    mirror: {
      constrainDimensions: true,
    },
  });

  let droppableOrigin;

  // --- Draggable events --- //
  droppable.on('drag:start', (evt) => {
    console.log('drag start')
    console.log('evt', evt)
    droppableOrigin = evt.originalSource.parentNode.dataset.dropzone;
    console.log('droppable origin', droppableOrigin)
  });

  droppable.on('droppable:dropped', (evt) => {
    console.log('in drop zone')
    if (droppableOrigin !== evt.dropzone.dataset.dropzone) {
      evt.cancel();
    } else {
      console.log('inside else')
      const drag_item = document.getElementById("draggable-item");
      const drop_folder = document.getElementById("droppable-folder");
      console.log("drag item", drag_item);
      console.log("drop_folder", drop_folder);

      drop_folder.innerHTML = drag_item.innerHTML;

    }
  });

  console.log('end of droppable return', droppable)
  return droppable;
}

export { uniqueDropzone }
