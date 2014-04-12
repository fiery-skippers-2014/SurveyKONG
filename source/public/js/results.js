$(document).ready(function () {

  $('.submitbutton').on("click", function(e){
    event.preventDefault();

    $.ajax({
      type: "post",
      url: "/viewresults",
      data: $(this).serialize,

      success: function(data){
        x = JSON.parse(data);
        console.log(x[0]);
        $('.submitbutton').append("<h4>Survey was completed "+ x[0]+" times</h4>");
        for(i = 1; i <= x[0]; i++){
          console.log(i)
          console.log(x[i])
          $('.submitbutton').append("<li> Question " + i + ": " +  (x[i] *100) + " % true")
        }
      },

      error: function(data){
        console.log("That didn't work")
      }
    })
  });
});
