function check_image_size(){var e=!0;if(null!=$("#photo_name")[0]&&null!=$("#photo_name")[0].files[0]){var r=$("#photo_name").val().split(".").pop().toLowerCase(),s=$("#photo_name")[0].files[0].size,o="1000000";-1==$.inArray(r,["gif","png","jpg","jpeg","bmp"])?($("#photo_ext_error_message").removeClass("invisible_error_msg"),$("#photo_ext_error_message").addClass("visible_error_msg"),$("#photo_size_error_message").removeClass("visible_error_msg"),$("#photo_size_error_message").addClass("invisible_error_msg"),e=!1):s>o&&($("#photo_ext_error_message").removeClass("visible_error_msg"),$("#photo_ext_error_message").addClass("invisible_error_msg"),$("#photo_size_error_message").removeClass("invisible_error_msg"),$("#photo_size_error_message").addClass("visible_error_msg"),e=!1)}return e}$(document).ready(function(){$("#change_password").click(function(){$("#change_password").toggle(),$("#change_password_block").toggle()}),$("#clear").click(function(){$("#new_user input[type=text]").each(function(){$(this).attr("value","")}),$("#photo_ext_error_message").removeClass("visible_error_msg"),$("#photo_size_error_message").removeClass("visible_error_msg"),$("#photo_ext_error_message").addClass("invisible_error_msg"),$("#photo_size_error_message").addClass("invisible_error_msg")})});