$(document).ready(function($) {
	moveItems(2,"homeactivitylog");
	
	$('.tooltipname').tooltipster({ interactive: true, fixedWidth: 280});
	
	$("#top_rated").click(function() {
      $.ajax({
        url: "pages/top_rated_books",
        type: "GET",        
        success: function (data) { 
          $("#toprated").html(data);          
        }
      });
    });
});

function moveItems(direction, divname){
	var xmlhttp;
    if (window.XMLHttpRequest){
      // code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
    }
    else{
      // code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange=function(){
      if (xmlhttp.readyState==4 && xmlhttp.status==200){
        document.getElementById(divname).innerHTML=xmlhttp.responseText;
      }
    }
    if (direction == 0){
      start = start - 1;
    }
    else if(direction == 1){
      start = start + 1;
    }
    else if(direction == 2)
    {
    	start = 1;
    }
    xmlhttp.open("GET","/activities/get_activity_log?start=" + start, true);
    xmlhttp.send();
}