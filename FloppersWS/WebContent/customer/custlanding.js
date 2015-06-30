
$(function() {
    
	$("#profile_section").show();
	$("#chat_section").hide();

    $("#home_btn").click(function(){
        
        $("#profile_section").show(500);
        $("#chat_section").hide(500);
     });
    

 
 // Event handler for send message button
 $('#chat-btn').on('click', function() {
   sendMessage();
 });
 
 
    /** setup(config) intializes kandy
       @param <object> config
     */
     kandy.setup({
       // listeners registers events to handlers
       // You can handle all Kandy Events by registering it here
       listeners: {
         messagesavailable: onMessagesAvailable
       }
     });
 
   // Function to send message to another Kandy user
   function sendMessage() {
     var message = $('#chat-message').val();
     $('#chat-message').val('');
     //var sendTo = $('#chat-contacts').val();
 
     /** sendIm(userName, message, success, failure)
         Sends a message via chat
         @params <string> userName, <string> message, <function> success/failure
     */
     kandy.messaging.sendIm(sendTo, message, function () {
 
       // On successful send, append chat item to DOM
   
       //var $username = $('<h5>').text(username);
    var $username="You";    
    var $message = message;
    //$('#xe-body ul').append('<li>Hi test</li>');;
    $("#xe-body ul").append('<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/user-2.png"></a><div class="xe-comment"><strong>'+$username+'</strong></a><p>'+$message+'</p></div></div></li>');
      
     },
     function () {
         alert('IM send failed');
       }
     );
   }
 
   // Event handler for messagesavailable 
     // receive messages from other Kandy users
     function onMessagesAvailable(){
 
 
       /** getIm(success, failure)
           Retrieve any new instant messages (text, files, etc.)
           @params <function> success/failure
       */
       kandy.messaging.getIm(function(data) {
 
         // data object is an array of incoming messages sent on successful getIM()
         // Iterate through data object & append messages to DOM
         data.messages.forEach(function(msg) {
 
           if(msg.messageType == 'chat' && msg.contentType === 'text' && msg.message.mimeType == 'text/plain') {
             var $username = $('<h5>').text(msg.sender.user_id);
             var $message = $('<p>').text(msg.message.text);
             var $chatItem = $('<div class="well text-left">')
 
             $chatItem.append($username, $message);
             $('#chat-messages').append($chatItem);
             
             
             var $username="Admin";    
             var $message = msg.message.text;
             //$('#xe-body ul').append('<li>Hi test</li>');;
             $("#xe-body ul").append('<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/cust_service.png"></a><div class="xe-comment"><strong>'+$username+'</strong></a><p>'+$message+'</p></div></div></li>');

           } else {
             // When the recieved messageType is not chat, display message type
             console.log('received ' + msg.messageType + ': ');
           }
         });
       },
       function() {
         alert('error recieving IMs');
       });
 
     }
 
   var username;
 var userArray=[];
 var sendTo="admin@webrtc.techmahindra.com";
 
 // Event handler for login form button
 $('#support').on('click', function(e) {
   e.preventDefault();
  
   $("#profile_section").hide(500);
   $("#chat_section").show(500);
   // Values extracted from login form
  /* username = $('#username').val();
   var apiKey = $('#api_key').val();
   var password = $('#password').val();*/
   username="customer1";
   var apiKey="DAK5aa3e878df1d46ca9f83e27ad0dfba1f";
   password="reset@123";
    
   /** login(domainApiId, userName, password,success,failure)
       logs in user to Kandy Platform
       @params <string> domainApiId, <string> userName, <string> password,  <function> success/failure
   */
   kandy.login(apiKey, username, password,function(msg){
     userArray.push(username);
     kandy.getLastSeen(userArray);
     UIState.authenticated();
     
     //Checks every 5 seconds for incoming messages
     setInterval(receiveMessages, 5000);
   },
   function(msg){
     UIState.unauthenticated();
     alert('Login Failed!');
  });
 });
 
 // Event handler for logout button
 $('#logout-btn').on('click', function() {
 
   /** logout(success) logs a user out of the Kandy Platform
       @param <function> success - Callback handler for
       successful logout
   */
   kandy.logout(function() {
     userArray.push(username);
     kandy.getLastSeen(userArray);
     UIState.unauthenticated();
   });
 });
 
   /** UIState is a custom piece of code that shuffles between UI states
     eg:: If user is authenticated, the relevant DOM elements are brought to screen
     and the rest are hidden. Using this method is NOT recommended!
 */
 
 var username, UIState = {};
 
 UIState.authenticated = function() {
   $('#login-form').addClass('hidden');
   $('#logged-in').removeClass('hidden');
   $('.username').text(username);
 };
 
 UIState.unauthenticated = function() {
   $('#login-form').removeClass('hidden');
   $('#logged-in').addClass('hidden');
   $('.username').text('');
 };
 
 UIState.initial = function() {
   console.log('initial');
 
   $audioRingIn[0].pause();
   $audioRingOut[0].pause();
 
   $('#call-form p, #incoming-call p, #call-connected p').text('');
   $('#incoming-call, #call-connected, .call-terminator, #resume-call-btn').addClass('hidden');
   $('#call-form, .call-initializer').removeClass('hidden')
 };
 });

window.setInterval(function() {
    var elem = document.getElementById('xe-body');
    elem.scrollTop = elem.scrollHeight;
  }, 5000);
