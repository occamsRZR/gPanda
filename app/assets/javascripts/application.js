// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function($) {
  //$('#jobOptions').hide();
  // when the #job_method field changes
  $("#job_method").live('change', function() {
    // make a POST call and replace the content
    var program_id = $('select#job_method :selected').val();


    if(program_id == ""){
        program_id="0";
        $('#jobOptions').hide('slow');
    }
    else{
    jQuery.get('/jobs/update_program_select/' + program_id, function(data){
        $("#jobOptions").html(data).show();
    });
    }
    return false;
  });

});