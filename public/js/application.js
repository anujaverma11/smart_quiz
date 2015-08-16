$(document).ready(function() {
  $(".submitBtn").click(function(e) {
    e.preventDefault()
    postForm();
  })
});

var postForm = function(data) {
  $.ajax({
    url: '/submitquiz',
    method: 'POST',
    data: data
  }).done(function(response) {
    console.log(response);
  })
}

var answerQuestion = function(optionID, questionID, studentAssesmentID) {

  dataObject = {
    option_id: optionID,
    question_id: questionID
  }

  studentAssesmentID =

  $.ajax({
    url: "/student_assessments/" + studentAssesmentID + "/student_assessment_questions/new"
    method: 'POST',
    data: dataObject
  }).done(function(responseData) {
    nextQuestion(responseData);
  }).fail(function(responseData) {
    errorHandler(responseData);
  })
}

var nextQuestion = function() {}

var errorHandler = function(responseData) {
  console.log(responseData);
}

