function updatedetailedrate(a,t){$.ajax({url:"/rating/detailed_rate/"+a+"/"+t,type:"GET",success:function(a){$("#detailedrate").html(a)}})}function rate_object(a,t,r,e){if(a){if(0!=parseInt($(this).attr("value"))){var s=!1;if(1==e&&3==$("#star1").attr("class").split(" ").length&&0==$("#star2").attr("class").localeCompare("starrating")){for(i=1;i<=5;i++)$("#star"+i).removeClass("on");s=!0}else for(i=1;i<=5;i++)i<=e?$("#star"+i).addClass("on"):$("#star"+i).removeClass("on");s&&(s=!1,e=0),$.ajax({type:"GET",url:"/rating/rate/"+e+"/"+r+"/"+a+"/"+t,success:function(a){update_avg_rate(a),updatedetailedrate(t,r)}})}}else window.location.replace("/users/login")}function load_user_rating(a){if(-1!=a){var t=a;for(i=1;i<=t;i++)$("#star"+i).addClass("on")}}function prepare_avg_rate(){$(".averagerate").jRating({isDisabled:!0,bigStarsPath:"/assets/images_en/stars_white.png"})}function update_avg_rate(a){$("#rating_part").html(a),prepare_avg_rate()}$(function(){$("#star1, #star2, #star3, #star4, #star5").mouseover(function(){var a=parseInt($(this).attr("value"));for(i=1;i<=5;i++)i<=a?$("#star"+i).addClass("shine"):$("#star"+i).removeClass("shine")}),$("#star1, #star2, #star3, #star4, #star5").mouseout(function(){for(i=1;i<=5;i++)$("#star"+i).removeClass("shine")})});