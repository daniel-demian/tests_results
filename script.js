function toggleModal(attemptId) {
  var modal = document.getElementById("questionsModal");
  var modalContent = document.getElementById("modalContent");
  var userId = document.querySelector(
    '.user-id[data-attempt-id="' + attemptId + '"]'
  ).innerText;
  var test_result = document.querySelector(
    '.score[data-attempt-id="' + attemptId + '"]'
  ).innerText;

  modalContent.innerHTML =
    "<p><strong>User ID:</strong> " +
    userId +
    " | <strong>Test result:</strong> " +
    test_result +
    "</p>" +
    '<table class="question-table"><thead><tr><th>Question Number</th><th>Correct Answer</th><th>User Answer</th></tr></thead><tbody></tbody></table>';

  var tbody = modalContent.querySelector("tbody");
  var questions = document.querySelectorAll(
    '.questions[data-attempt-id="' + attemptId + '"]'
  );
  questions.forEach(function (question) {
    var questionNumber = question.querySelector(".question-number").innerText;
    var correctAnswer = question.querySelector(".correct-answer").innerText;
    var userAnswer = question.querySelector(".user-answer").innerText;

    var row = document.createElement("tr");
    row.innerHTML =
      "<td>" +
      questionNumber +
      "</td>" +
      "<td>" +
      correctAnswer +
      "</td>" +
      '<td style="color: ' +
      (correctAnswer === userAnswer ? "green" : "inherit") +
      ';">' +
      userAnswer +
      "</td>";
    tbody.appendChild(row);
  });

  modal.style.display = "flex";
}

function closeModal() {
  var modal = document.getElementById("questionsModal");
  modal.style.display = "none";
}

window.onclick = function (event) {
  var modal = document.getElementById("questionsModal");
  if (event.target == modal) {
    modal.style.display = "none";
  }
};
