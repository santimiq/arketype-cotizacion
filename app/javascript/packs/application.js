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
    const second = e.children[1];

    if (first.classList.contains(className) && first.classList.contains(hint)) {
        first.classList.remove(className)
        second.classList.remove(className)
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
  const second = e.children[1];
    if(first.classList.contains("fa")  ){
      first.classList.add("active")
      second.classList.add("active")
    }
}

const removeDNoneIfIconIsActive = function(){
  const parent = document.querySelector(".title-parent");
  console.log(parent.children.length);

  for(var i = 0; i < parent.children.length; i++){
    const prueba = parent.children[i]
    if(prueba.children[0].children[0].classList.contains("active")){
      console.log("has active")
     const firstPParent = document.querySelector(".firstP-parent");
     firstPParent.children[i + 2].children[0].classList.remove("d-none");
    }else{
      console.log("no active")
    }
  }

  // const prueba = parent.querySelectorAll(".prueba");
  // prueba.forEach((e)=>{

  //      const title = e.querySelector(".title")

  //   if (title.children[0].classList.contains("active")){
  //         console.log("title")
  //         console.log(title.)
  //         // i.querySelectorAll(".firstP").forEach((k)=>{
  //         //   k.classList.remove("d-none")
  //         // })

  //       }
  // })


}

titles.forEach((title) => {
  title.addEventListener("click", (event) => {
    document.querySelectorAll(".firstP").forEach((element) => {
      if(event.target.classList.contains("active")){
      }else{
        removeAll(titles,"active", "fa")
        addActiveToI(title)
        addActiveToI(title)
        hideAll()
        removeDNoneIfIconIsActive()
    }
    })
  })
})
