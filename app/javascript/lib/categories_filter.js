
document.addEventListener("turbo:load", () => {

  const categories = document.querySelectorAll(".categories-list .category")
  categories.forEach((categoryElement) => {

    const tag = categoryElement.querySelector("input[type=checkbox]");
    console.log(categoryElement)
    if (tag.checked) {
      categoryElement.classList.add("active-category")
    }

    categoryElement.addEventListener("click", (event) => {
      const tag = categoryElement.querySelector("input[type=checkbox]");
      tag.checked = !tag.checked

      categoryElement.classList.remove("active-category")

      if (tag.checked) {
        categoryElement.classList.add("active-category")
      }
    });
  });

})
