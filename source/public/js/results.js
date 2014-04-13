$(document).ready(function () {

  $('.results button').click(function(event){
    event.preventDefault();
    console.log(this)
    var surveyID = $(this)[0].id
    $.ajax({
      type: "post",
      url: "/viewresults",
      data: {id: $(this)[0].id},

      success: function(data){
        x = JSON.parse(data);
        $('#'+surveyID).html("<h4>Survey was completed "+ x[0]+" times</h4>");
        i = 1;
        while(x[i] != null){
          console.log(i)
          console.log(x[i])

          $('#'+surveyID).append("<p>Question " + i + ": " +  ((x[i]/x[0])*100).toFixed(2) + " % true</p>")

          i++;
        }
      },

      error: function(data){
        $('#'+surveyID).html("<h4>No one has taken this survey :(</h4>");
        console.log("That didn't work")
      }
    })
  });
});


