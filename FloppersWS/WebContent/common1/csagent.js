$(function() {
	var callId, username;

	// Create audio objects to play incoming calls and outgoing calls sound
	var $audioRingIn = $('<audio>', {
		loop : 'loop',
		id : 'ring-in'
	});
	var $audioRingOut = $('<audio>', {
		loop : 'loop',
		id : 'ring-out'
	});

	// Load audio source to DOM to indicate call events
	var audioSource = {
		ringIn : [
				{
					src : 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringin.mp3',
					type : 'audio/mp3'
				},
				{
					src : 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringin.ogg',
					type : 'audio/ogg'
				} ],
		ringOut : [
				{
					src : 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringout.mp3',
					type : 'audio/mp3'
				},
				{
					src : 'https://kandy-portal.s3.amazonaws.com/public/sounds/ringout.ogg',
					type : 'audio/ogg'
				} ]
	};

	audioSource.ringIn.forEach(function(entry) {
		var $source = $('<source>').attr('src', entry.src);
		$audioRingIn.append($source);
	});

	audioSource.ringOut.forEach(function(entry) {
		var $source = $('<source>').attr('src', entry.src);
		$audioRingOut.append($source);
	});

	/**
	 * setup(config) intializes KandyAPI
	 * 
	 * @param <object>
	 *            config
	 */
	KandyAPI.Phone.setup({

		remoteVideoContainer : $('#incoming-video')[0],
		localVideoContainer : $('#outgoing-video')[0],
		// listeners registers events to handlers
		// You can handle all Kandy Events by registering it here
		listeners : {
			loginsuccess : onLoginSuccess,
			loginfailed : onLoginFailed,
			callinitiated : onCallInitiate,
			callinitiatefailed : onCallInitiateFail,
			oncall : onCall,
			callended : onCallTerminate,
			callendedfailed : onCallEndedFailed
		}
	});

	/**
	 * UIState is a custom piece of code that shuffles between UI states eg:: If
	 * user is authenticated, the relevant DOM elements are brought to screen
	 * and the rest are hidden. Using this method is NOT recommended!
	 */

	var username, UIState = {};

	UIState.authenticated = function() {
		$('#login-form').addClass('hidden');
		$('#logged-in').removeClass('hidden');
		$('#chat-container').removeClass('hidden');
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
		$('#incoming-call, #call-connected, .call-terminator, #resume-call-btn')
				.addClass('hidden');
		$('#call-form, .call-initializer').removeClass('hidden')
	};
	// Event handler for loginsuccess event
	function onLoginSuccess() {
		KandyAPI.Phone.updatePresence(0);
		UIState.authenticated();
		loadContacts();

		// Checks every 5 seconds for incoming messages
		setInterval(receiveMessages, 1000);
	}

	// Event handler for onLoginFailed event
	function onLoginFailed() {
		UIState.unauthenticated();
		alert('Login Failed!');
	}// Event handler for login form button
	$('#login-btn').on('click', function(e) {
		e.preventDefault();

		// Values extracted from login form
		username = $('#username').val();
		var apiKey = $('#api_key').val();
		var password = $('#password').val();

		/*
		 * username="admin"; var apiKey="DAK5aa3e878df1d46ca9f83e27ad0dfba1f";
		 * password="reset@123";
		 */

		/**
		 * login(domainApiId, userName, password) logs in user to Kandy Platform
		 * 
		 * @params <string> domainApiId, <string> userName, <string> password
		 */
		KandyAPI.Phone.login(apiKey, username, password);
	});// Event handler for logout button
	$('#logout-btn').on('click', function(e) {
		e.preventDefault();
		/**
		 * logout(success) logs a user out of the Kandy Platform
		 * 
		 * @param <function>
		 *            success - Callback handler for successful logout
		 */
		KandyAPI.Phone.logout(function() {
			UIState.unauthenticated();
		});
	});
	// Event handler for callinitiate
	function onCallInitiate(call) {
		callId = call.getId();

		$audioRingIn[0].pause();
		$audioRingOut[0].play();

		$('#username-calling').text('Calling ' + $('#user_to_call').val());
		UIState.callinitialized();
	}

	// Event handler for callinitiatefail event
	function onCallInitiateFail() {
		console.debug('call initiate fail');

		$audioRingOut[0].pause();
		UIState.initial();
		alert('call failed');
	}

	UIState.callinitialized = function() {
		console.log('callinitialized');

		$('.call-initializer').addClass('hidden');
	};// Event handler for initiate call button
	$('#initialize-call-btn').on('click', function() {
		var username = $('#user_to_call').val();

		/**
		 * makeCall( userName, cameraOn ) : Void Initiates a call to another
		 * Kandy user over web
		 * 
		 * @params <string> userName, <boolean> cameraOn
		 */
		KandyAPI.Phone.makeCall(username, true);
	});
	// Event handler for oncall event
	function onCall(call) {
		console.debug('oncall');
		$audioRingOut[0].pause();
		UIState.oncall();
	}

	// Event handler for callended event
	function onCallTerminate(call) {
		console.debug('callended');
		callId = null;

		$audioRingOut[0].play();
		$audioRingIn[0].pause();

		UIState.initial();
	}

	// Event handler for callendedfailed event
	function onCallEndedFailed() {
		console.debug('callendfailed');
		callId = null;
	}

	$('#hold-call-btn').on('click', function() {
		KandyAPI.Phone.holdCall(callId);
		UIState.holdcall();
	});

	$('#resume-call-btn').on('click', function() {
		KandyAPI.Phone.unHoldCall(callId);
		UIState.resumecall();
	});

	// Event handler for call end button
	$('#end-call-btn').on('click', function() {
		KandyAPI.Phone.endCall(callId);
		UIState.initial();
	});

	UIState.oncall = function() {
		console.log('oncall');

		$('#incoming-call, #call-form').addClass('hidden');
		$('#call-connected').removeClass('hidden');
	};

	UIState.holdcall = function() {
		console.log('holdcall');

		$('#hold-call-btn').addClass('hidden');
		$('#resume-call-btn').removeClass('hidden');
	};

	UIState.resumecall = function() {
		console.log('resumecall');

		$('#hold-call-btn').removeClass('hidden');
		$('#resume-call-btn').addClass('hidden');
	};

	// Chat integeration
	// Event handler for send message button
	$('#chat-btn').on('click', function() {
		sendMessage();
	});

	// Function to send message to another Kandy user
	function sendMessage() {
		var message = $('#chat-message').val();
		var sendTo = $('#chat-contacts').val();

		/**
		 * sendIm(userName, message, success, failure) Sends a message via chat
		 * 
		 * @params <string> userName, <string> message, <function>
		 *         success/failure
		 */
		KandyAPI.Phone.sendIm(sendTo, message, function() {

			// On successful send, append chat item to DOM
			var $chatItem = $('<div class="well text-right">')
			var $username = $('<h5>').text(username);
			var $message = $('<p>').text(message);

			var $newMsg = "<br><b>" + username + ":</b>&nbsp;" + message;

			$chatItem.append($username, $message);
			$('#chat-messages').append($newMsg);
		}, function() {
			alert('IM send failed');
		});
	}

	// Function to receive messages from other Kandy users
	function receiveMessages() {

		/**
		 * getIm(success, failure) Retrieve any new instant messages (text,
		 * files, etc.)
		 * 
		 * @params <function> success/failure
		 */
		KandyAPI.Phone.getIm(function(data) {

			// data object is an array of incoming messages sent on successful
			// getIM()
			// Iterate through data object & append messages to DOM
			data.messages.forEach(function(msg) {

				if (msg.messageType == 'chat' && msg.contentType === 'text'
						&& msg.message.mimeType == 'text/plain') {
					var $username = $('<h5>').text(msg.sender.user_id);
					var $message = $('<p>').text(msg.message.text);
					var $chatItem = $('<div class="well text-left">')

					var $newMsg = "<br><b>" + msg.sender.user_id
							+ ":</b>&nbsp;" + msg.message.text;
					$chatItem.append($username, $message);
					$('#chat-messages').append($newMsg);
				} else {
					// When the recieved messageType is not chat, display
					// message type
					console.log('received ' + msg.messageType + ': ');
				}
			});
		}, function() {
			alert('error recieving IMs');
		});
	}

	// Function that loads all Kandy contacts and appends to DOM
	function loadContacts() {

		/**
		 * retrievePersonalAddressBook(success, failure) Retrieve all entries of
		 * the user's personal address book
		 * 
		 * @params <function> success, <function> failure
		 */
		KandyAPI.Phone
				.retrievePersonalAddressBook(
						function(results) {

							// results object is an array of address book
							// entries sent by Kandy
							// on successful address book retrieval
							var addressJson = results;
							// alert(addressJson.length);

							if (addressJson.length > 0) {

								for (var i = 0; i < addressJson.length; i++) {
									var data = addressJson[i];
									var $option = $('<option>');

									$option.val(data.name)
											.text(data.first_name);
									$('#chat-contacts').append($option);
								}
							} else {
								alert('Sorry, you have no contacts in your address book');
							}
						},
						function() {
							alert('Error - something went wrong when we tried to access your address book.');
						});
	}

});