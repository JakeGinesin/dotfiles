/**
 * String to be used for each month of the year.
 */
const months = [
  "January", 
  "February", 
  "March", 
  "April", 
  "May", 
  "June", 
  "July", 
  "August", 
  "September", 
  "October", 
  "November", 
  "December"
]

/**
 * Current date and time.
 */
var date;

/**
 * Adds a fade transition between pages.
 */
function fade() {
  if (!window.AnimationEvent) return

  var fader = document.getElementById('fader')
  fader.classList.add('fade-out')
}

/**
 * Gets the current date and time.
*/
function getDate() {
  // Get the date
  var dateNow = new Date()

  // Date components
  var month = months[dateNow.getMonth()]
  var day = dateNow.getDate()
  var year = dateNow.getFullYear()

  // Time components
  var hours = ('0' + dateNow.getHours()).slice(-2);
  var minutes = ('0' + dateNow.getMinutes()).slice(-2);
  var seconds = ('0' + dateNow.getSeconds()).slice(-2);

  // Inserting result
  date = `${month} ${day}, ${year} | ${hours}:${minutes}:${seconds}`
  document.getElementById("date").innerHTML = date;
}

/**
 * Once the page has loaded, get the date and update every second.
 */
document.addEventListener('DOMContentLoaded', function() {
  getDate()
  setInterval(getDate, 1000)
})

document.addEventListener("keydown", function(event) {
  if (event.key === "Escape") {
    document.activeElement.blur();
  }
});

/**
 * Adds a fade out animation to the page.
 */
window.addEventListener('pageshow', function(event) {
  if (!event.persisted) return

  var fader = document.getElementById('fader')
  fader.classList.remove('fade-in')
})
