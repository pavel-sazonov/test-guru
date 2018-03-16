document.addEventListener('turbolinks:load', function() {
  var timer = document.getElementById('timer')

  if (timer) { changeTimer(timer) }
})


function changeTimer(timer) {
    startPoint = timer.dataset.startPoint
    timeAmount = timer.dataset.timeAmount
    timeNow = (Date.now() / 1000).toFixed()
    passedTime = timeNow - startPoint

    if (passedTime >= timeAmount) {
        location.href = timer.dataset.resultLink
    }

    timer.textContent = timeAmount - (passedTime)
    setTimeout(changeTimer, 1000, timer);
}
