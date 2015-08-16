$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


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
