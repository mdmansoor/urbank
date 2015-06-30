$("#profile_section").show();
    $("#chat_section").hide();
	

$(document).ready(function(){
	
	
    $("#support").click(function(){
       
       $("#profile_section").hide(500);
       $("#chat_section").show(500);
    });
    
    $("#home_btn").click(function(){
        
        $("#profile_section").show(500);
        $("#chat_section").hide(500);
     });
});