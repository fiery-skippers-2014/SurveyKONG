$(document).ready(function () {

  var counter = 1

  $('#add_question').on('click', function(){
    event.preventDefault();
    // counters should always be handled by css, specifically through the counter-increment
    // property and :after :before elements
    counter+=1
    // a global counter variable is probably not necessary. You can use li's and counter-increment to handle this logic.
    $('<p>Question '+counter+'</p>  <input type="text" name="question'+counter+'"> <hr>').insertBefore("#question_format");
    $('input[name="total_questions"]').val('' +counter+ '')
  });



});





