let scroll = 0;
const card = document.querySelector(".card");
const unpack = function () {};
const repack = function () {};

window.addEventListener("wheel", function (evt) {
  if (evt.deltaY > 0) {
    scroll += 5;
  } else if (evt.deltaY < 0 && scroll > 0) {
    scroll -= 5;
  }
  console.log(scroll);
});
