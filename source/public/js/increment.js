$(document).ready(function () {
  var counter = -1;

$('#form_click').on('click', function(){
  event.preventDefault();
  counter++;

  $.ajax({
    type: "POST",
    url: $(location).attr('href'),
    data: {thing: "woo"} // fix this


  success: function(data) {
        var json = JSON.parse(data);
        console.log(json);
        var choice_true_obj = json[0][0].question_choice;
        var choice_false_obj = json[0][1].question_choice;
        var question_obj = json[1].question;


        $('#put_stuff').html('' +question_obj.question+ '');
        $('#true_false').html('<input class="radio_display" type="radio" name="same" value=" '+choice_true_obj.id+' "><br><input class="radio_display" type="radio" name="same" value=" '+choice_false_obj.id+' "><br>');


       }
  });


});



});
