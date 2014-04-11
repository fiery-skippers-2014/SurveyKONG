$(document).ready(function () {

$(function() {
var addDiv = $('#addinput');
var i = $('#addinput p').size() + 1;
$('#addNew').live('click', function() {
$('<p><input type="text" id="p_new" size="40" name="p_new_' + i +'" value="" placeholder="I am New" /><a href="#" id="remNew">Remove</a> </p>').appendTo(addDiv);
i++;

return false;

});
$('#remNew').live('click', function() {

if( i > 2 ) {

$(this).parents('p').remove();

i--;
}
return false;
});
});

});







//   // Optional - Use AJAX to send an HTTP DELETE request for the sign-out link
//   $('.postvote').on('click', function(event) {
//     event.preventDefault();
//     var go = $(this).parent();

//     $.ajax({
//         type: "post",
//         url: "/postvote",
//         data: $(go).serialize(),
//         success: function(data) {
//           var json = JSON.parse(data)
//           $('#upvotes'+json.post_id).html(json.votecount)
//         },
//         error: function() {
//           console.log("fail")
//         }
//     });
//   });

//   $('.postcomment').on('click', function(event) {
//       event.preventDefault();
//       var go = $(this).parent();


//     $.ajax({
//       type: "post",
//       url: "/postcomment",
//       data: $(go).serialize(),
//       success: function(data) {
//         var json = JSON.parse(data);
//         console.log(json)
//         $('#upvotesa'+json.comment_id).html(json.votecount)
//       }
//     });
//   });
// });
