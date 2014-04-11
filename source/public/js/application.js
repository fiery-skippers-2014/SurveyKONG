$(document).ready(function () {




  var counter = 0;

  $('.add').on('click', function(){
      counter ++;
      $('<input id="question'+counter+'" class="add">Add</input><a href="#">Click</a>').insertBefore('.add:last');
  });
});





