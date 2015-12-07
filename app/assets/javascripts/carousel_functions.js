function get_carousel(href, job_id, type)
  {
    $.ajax({
      url: href + "&job_id=" + job_id + "&type=" + type,
      type: "GET",        
      success: function (data) {
        $("#" + type + "_carousel").html(data);
      }
    });
}

function load_carousel(job_id, type)
    {
      $.ajax({
      url: "/carousel/get_carousel?job_id=" + job_id + "&type=" + type + "&page=1",
      type: "GET",        
      success: function (data) {
        $("#" + type + "_carousel").html(data);
      }
    });
}