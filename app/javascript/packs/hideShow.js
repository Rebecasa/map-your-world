const visited = document.querySelectorAll('.hiden-visited');
const clickDown1 = document.querySelectorAll('.toggle-visited');
const clickDown2 = document.querySelectorAll('.toggle-visited-2');
const planned = document.querySelectorAll('.hiden-planned');

clickDown1.forEach(function(clickD) {
  clickD.addEventListener('click', function() {
    visited.forEach(function(visit) {
      clickD.classList.toggle("click-up")
      visit.classList.toggle("show-visited")
   })
  })
 })

clickDown2.forEach(function(clickD2) {
  clickD2.addEventListener('click', function() {
    planned.forEach(function(plan) {
      clickD2.classList.toggle("click-up")
      plan.classList.toggle("show-visited")
   })
  })
 })
