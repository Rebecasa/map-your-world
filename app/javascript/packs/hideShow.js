const visited = document.getElementById('hiden-visited')
const clickDown = document.getElementById('toggle-visited')
const clickUp = document.getElementById('click-up')
const planned = document.getElementById('hiden-planned')

 clickDown.addEventListener('click',function(){
  visited.style.display = "block"
  clickDown.style.display = "none"
  clickUp.style.display = "block"

 })
