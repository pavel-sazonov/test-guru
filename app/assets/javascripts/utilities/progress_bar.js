document.addEventListener('turbolinks:load', function() {
  var bar = document.getElementById('progress')

  if (bar) { changeProgress(bar) }
})

function changeProgress(bar) {
  questionNumber = bar.dataset.questionNumber
  questionsCount = bar.dataset.questionsCount
  percents = ((questionNumber - 1) / questionsCount).toFixed(2) * 100 + '%'

  progress = (questionNumber) ? percents : '100%'

  bar.style.width = bar.textContent = progress
}
