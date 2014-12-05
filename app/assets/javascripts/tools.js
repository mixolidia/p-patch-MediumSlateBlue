// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

//TOOLS
//manage.html.erb, append input field

$(function() {

  $("#add_field").click(function(event) {
    event.preventDefault();
    var $emptyField = $('<form accept-charset="UTF-8" action="/tools/add" class="new_tool" id="new_tool" method="post"><div style="display:none"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="LOpwmfCiuYBU1UaM48ebgs0uaah5ya3rrQY8ijDyRtE="></div><div><input id="tool_name" name="tool[name]" placeholder="Tool" type="text"></div></form>');
    $("#input_field").append($emptyField);
  });

  $("#input_field").on("click",".remove_field", function(event){ //user click on remove text
    event.preventDefault(); $(this).parent('div').remove();
  });

});
