// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//TOOLS
//manage.html.erb, append input field

$(function() {

  var i = 1;
  $("#add_field").click(function(event) {
    event.preventDefault();
    //find a way to get each of these name values different for params
    var $emptyField = $('<div><input class="tool_name" "name"="tool[name]" placeholder="Tool" type="text"><a href="#" class="remove_field">Remove</a></div>');
    $(".input_field form").append($emptyField);
    i++;
  });

  $(".input_field").on("click",".remove_field", function(event){ //user click on remove text
    event.preventDefault(); $(this).parent('div').remove();
  });

});
