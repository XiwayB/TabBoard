const Choices = require('choices.js')
const initChoices = () => {
  const elements = document.querySelectorAll("[data-behavior='choicesjs']"); //dropdown called select
  // const element = document.getElementById("job_city_id");
  console.log('inside initChoices');
  if (elements.length) {
    console.log('inside initChoices, elements found!');
    elements.forEach(element=> {
      new Choices(element, {
        removeItems: true,
        removeItemButton: true,
        shouldSort: false,
        classNames: {
        }
      });
    })
  }
}
export { initChoices }
