function check_reset_password_paramters() {
  var is_input_valid = true;
  if (($('#entered_password').val() == null) || ($('#entered_password').val() == '')){
    $('#password_error').removeClass("invisible_error_msg");
    $('#password_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
  
  if ((($('#entered_password_confirmation').val() == null) || ($('#entered_password_confirmation').val() == ''))){
    $('#password_confirmation_error').removeClass("invisible_error_msg");
    $('#password_confirmation_error').addClass("visible_error_msg");
    is_input_valid = false;
  }
    return is_input_valid;
}