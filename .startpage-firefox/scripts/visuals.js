const img = document.getElementById('mainImg');
const btnImg = document.getElementById('image-cycle');
const btnImg_bw = document.getElementById('image-cycle-bw');

/**
 * Images to be used
 */

const images = [];
for (let i = 1; i <= 28; i++) {
  images.push(`t${i}.jpg`);
}

/**
 * Index of the image. Revert the the first image if nothing found
 * in the local storage.
 */
let imgIndex = localStorage.getItem('imgIndex') || 0

/*
 * Load image on page load.
 */
img.src = 'assets/img/' + images[imgIndex]

/**
 * Change image when clicking the button.
 */
function changeImg() {
  imgIndex = (imgIndex + 1) % images.length
  img.src = 'assets/img/' + images[imgIndex]
  localStorage.setItem('imgIndex', imgIndex)
}

function changeImg_bw() {
  imgIndex = (imgIndex + images.length - 1) % images.length
  img.src = 'assets/img/' + images[imgIndex]
  localStorage.setItem('imgIndex', imgIndex)
}

btnImg.addEventListener('click', changeImg)
btnImg_bw.addEventListener('click', changeImg_bw)
