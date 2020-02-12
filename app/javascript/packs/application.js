import "bootstrap";


import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))


const titles = document.querySelectorAll(".title")

titles.forEach((title) => {
  title.addEventListener("click", (event) => {
    document.querySelectorAll(".firstP").forEach((element) => {
      if (event.target.nextElementSibling.classList.contains("d-none") && !(event.target.nextElementSibling == element) ) {
        element.classList.toggle("d-none")
      }
      element.classList.toggle("d-none")
    })
  })
})
