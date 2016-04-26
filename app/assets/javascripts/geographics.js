$(document).ready(function(){
    $('.check100').on("click", function() {
      return reload_map();
    });
    $('.check200').on("click", function() {
      return reload_map();
    });
    $('.check300').on("click", function() {
      return reload_map();
    });
    $('.check400').on("click", function() {
      return reload_map();
    });
    $('.check500').on("click", function() {
      return reload_map();
    });
  });
  
  function reload_map(){
    checked_values = [];
    if ($('.check100').prop("checked") == true)
      checked_values.push(100);
    if ($('.check200').prop("checked") == true)
      checked_values.push(200);
    if ($('.check300').prop("checked") == true)
      checked_values.push(300);
    if ($('.check400').prop("checked") == true)
      checked_values.push(400);
    if ($('.check500').prop("checked") == true)
      checked_values.push(500);
    $(location).attr("href",'/geographics/index/'+checked_values.toString());
  }