$(document).ready(function () {

  // Optional - Use AJAX to send an HTTP DELETE request for the sign-out link
  $('.postvote').on('click', function(event) {
    event.preventDefault();
    var go = $(this).parent();

    $.ajax({
        type: "post",
        url: "/postvote",
        data: $(go).serialize(),
        success: function(data) {
          var json = JSON.parse(data)
          $('#upvotes'+json.post_id).html(json.votecount)
        },
        error: function() {
          console.log("fail")
        }
    });
  });

  $('.postcomment').on('click', function(event) {
      event.preventDefault();
      var go = $(this).parent();


    $.ajax({
      type: "post",
      url: "/postcomment",
      data: $(go).serialize(),
      success: function(data) {
        var json = JSON.parse(data);
        console.log(json)
        $('#upvotesa'+json.comment_id).html(json.votecount)
      }
    });
  });
});
