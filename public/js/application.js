$(document).ready(function () {

  var counter = 1

  $('#add_question').on('click', function(){
    event.preventDefault();
    counter+=1
    $('<p>Question '+counter+'</p>  <input type="text" name="question'+counter+'"> <hr>').insertBefore("#question_format");
    $('input[name="total_questions"]').val('' +counter+ '')
  });



});





