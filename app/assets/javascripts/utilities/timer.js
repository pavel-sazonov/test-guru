document.addEventListener('turbolinks:load', function() {
  var timer = document.getElementById('timer')
  var done = document.getElementById('done')

  if (timer) { changeTimer() }
})


function changeTimer() {
    if (timer.value >= timer.max) {
        location.href = timer.dataset.resultLink
    }
    timer.value++;
    setTimeout(changeTimer, 100);
}
