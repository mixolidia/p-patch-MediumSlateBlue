// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//TOOLS
//manage.html.erb, append input field

function addTextField() {
  var $emptyField = $('<div><input class="tool_name" name="tool[name][]" placeholder="Tool" type="text"><a href="#" class="remove_field">Remove</a></div>');
  $(".input_field form").append($emptyField);
}

$(function() {
  addTextField();
  $("#add_field").click(function(event) {
    event.preventDefault();
    //find a way to get each of these name values different for params
    addTextField();
  });

  $(".input_field").on("click",".remove_field", function(event){ //user click on remove text
    event.preventDefault(); $(this).parent('div').remove();
  });

});
