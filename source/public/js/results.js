$(document).ready(function () {

  $('.results button').on("click", function(e){
    event.preventDefault();
    console.log(this)

    $.ajax({
      type: "post",
      url: "/viewresults",
      data: {id: $(this)[0].id},

      success: function(data){
        x = JSON.parse(data);
        console.log(x[0]);
        $('.results').append("<h4>Survey was completed "+ x[0]+" times</h4>");
        for(i = 1; i <= x[0]; i++){
          console.log(i)
          console.log(x[i])
          $('.results').append("<li> Question " + i + ": " +  (x[i] *100) + " % true")
        }
      },

      error: function(data){
        console.log("That didn't work")
      }
    })
  });
});
