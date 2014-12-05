// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//TOOLS
//manage.html.erb, append input field

$(function() {
  $("#add_field").click(function(event) {
    event.preventDefault();
    var $emptyField = $("<div><input id='tool_name' name='tool[name]' placeholder='Tool' type='text'></div>");
    $("#input_field").append($emptyField);
  });

});



// $(document).ready(function() {
//   var max_fields      = 10; //maximum input boxes allowed
//   var wrapper         = $("#input_field"); //Fields wrapper
//   var add_button      = $("#add_field"); //Add button ID
//
//   var x = 1; //initlal text box count
//   add_button.click(function(event){ //on add input button click
//     event.preventDefault();
//     if(x < max_fields){ //max input box allowed
//       x++; //text box increment
//       $(wrapper).append("<%=f.text_field :name, placeholder: 'Tool' %>"); //add input box
//     }
//   });
//
//   $(wrapper).on("click","#remove_field", function(event){ //user click on remove text
//     event.preventDefault(); $(this).parent('div').remove(); x--;
//   });
// });
