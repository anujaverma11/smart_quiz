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
