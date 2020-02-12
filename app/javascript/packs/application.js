import "bootstrap";


import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

const titles = document.querySelectorAll(".title")

const removeAll = function(node, className, hint){
  node.forEach((e)=>{
   const first =  e.children[0];
    if (first.classList.contains(className) && first.classList.contains(hint)) {
        first.classList.remove(className)
    }
  })
};

const hideAll = function() {
  document.querySelectorAll(".firstP").forEach((e)=>{
    e.classList.add("d-none")
  })
}

const addActiveToI = function(e){
  const first = e.children[0];
    if(first.classList.contains("fa")){
      first.classList.add("active")
    }
}

const removeDNoneIfIconIsActive = function(){
  let parent = document.querySelectorAll(".title-parent");
  console.log(parent);
  parent.forEach((child)=>{
    console.log(".child")
    child.querySelectorAll(".prueba").forEach((i)=>{
      console.log("prueba")
      i.querySelectorAll(".title").forEach((j)=>{
        console.log("title")
        if(j.children[0].classList.contains("active")){
          console.log("title")
          i.querySelectorAll(".firstP").forEach((k)=>{
            k.classList.remove("d-none")
          })
        }
      })
    })
  })
}

titles.forEach((title) => {
  title.addEventListener("click", (event) => {
    document.querySelectorAll(".firstP").forEach((element) => {
      if(event.target.classList.contains("active")){
      }else{
        removeAll(titles,"active", "fa")
        addActiveToI(title)
        hideAll()
        removeDNoneIfIconIsActive()
    }
    })
  })
})
