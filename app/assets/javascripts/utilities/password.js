document.addEventListener('turbolinks:load', function() {
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password_confirmation) {
    password_confirmation.addEventListener('input', addIconToPasswordConfirmation) }
})

function addIconToPasswordConfirmation() {
  var password = document.getElementById('user_password')

  if (this.value == password.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-circle-slash').classList.add('hide')
  } else {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-circle-slash').classList.remove('hide')
  }
}
