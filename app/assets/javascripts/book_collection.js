$(document).ready(function($) {
  $('#create_new_collection').click(function(){      
    $('#new_collection').css('display', ($(this).is(':checked') ? 'block' : 'none'));
});
});