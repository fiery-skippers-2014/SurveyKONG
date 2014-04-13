$(document).ready(function () {

  $('.results button').on("click", function(e){
    event.preventDefault();
    console.log(this)
    var surveyID = $(this)[0].id
    $.ajax({
      type: "post",
      url: "/viewresults",
      data: {id: $(this)[0].id},

      success: function(data){
        console.log(data)
        x = JSON.parse(data);
        console.log(x.keys);
        $('#'+surveyID).html("<h4>Survey was completed "+ x[0]+" times</h4>");
        i = 1;
        while(x[i] != null){
          console.log(i)
          console.log(x[i])
          $('#'+surveyID).append("<li> Question " + i + ": " +  (x[i]/x[0])*100 + " % true")
          i++;
        }
      },

      error: function(data){
        console.log("That didn't work")
      }
    })
  });
});
