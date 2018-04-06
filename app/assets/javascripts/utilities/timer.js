document.addEventListener('turbolinks:load', function() {
  let timer = document.getElementById('timer')

  if (timer) { changeTimer(timer) }
})


function changeTimer(timer) {
    let startTime = timer.dataset.startTime,
        timeAmount = timer.dataset.timeAmount,
        timeNow = (Date.now() / 1000).toFixed(),
        passedTime = timeNow - startTime

    if (passedTime > timeAmount) {
        alert('Time is over, test was interrupted!')
        location.href = timer.dataset.resultLink
    }

    timer.textContent = timeAmount - passedTime

    setTimeout(changeTimer, 1000, timer);
}
