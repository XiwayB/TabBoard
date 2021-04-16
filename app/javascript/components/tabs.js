$(document).ready(function(){
$(".tab").mouseenter(function(){
$(this).next(".cap").next(".preview").animate({opacity: "1"});
$(this).next(".cap").animate({opacity: "1"});
});
$(".tab").mouseleave(function(){
$(this).next(".cap").next(".preview").animate({opacity: "0"});
$(this).next(".cap").animate({opacity: "0"});
});
});
