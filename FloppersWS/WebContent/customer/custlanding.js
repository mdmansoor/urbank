$(function() {

	$("#profile_section").show();
	$("#chat_section").hide();
	var connectionStatus = false;

	var sendTo = $('#agent').val();
	var username = $('#kandyUserName').val();
	var apiKey = $('#api_key').val();
	var password = $('#kandyPassWord').val();

	

	$("#home_btn").click(function() {

		$("#profile_section").show(500);
		$("#chat_section").hide(500);
	});

	// Event handler for send message button
	$('#chat-btn').on('click', function() {

		if (connectionStatus) {
			sendMessage();
		} else {
			alert("you are not in the queue, you cannot send message!!");
		}

	});
	$('#file-btn').on('click', function() {
		//alert("send File");
		sendFile();
	});

	// ---------- Video/Audio ---

	var callId;

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

	// ---------- --------------------------------------------

	/**
	 * setup(config) intializes kandy
	 * 
	 * @param <object>
	 *            config
	 */
	kandy.setup({
		// listeners registers events to handlers
		// You can handle all Kandy Events by registering it here
		remoteVideoContainer : $('#incoming-video')[0],
		localVideoContainer : $('#outgoing-video')[0],

		listeners : {
			messagesavailable : onMessagesAvailable,

			callincoming : onCallIncoming,
			oncall : onCall,
			callanswered : onCallAnswer,
			callended : onCallTerminate,
			callrejected : onCallRejected
		}
	});

	// Function to send message to another Kandy user
	function sendMessage() {
		var message = $('#chat-message').val();
		$('#chat-message').val('');
		// var sendTo = $('#chat-contacts').val();

		/**
		 * sendIm(userName, message, success, failure) Sends a message via chat
		 * 
		 * @params <string> userName, <string> message, <function>
		 *         success/failure
		 */
		console.log("sending message to " + sendTo);
		kandy.messaging
				.sendIm(
						sendTo,
						message,
						function() {

							// On successful send, append chat item to DOM

							// var $username = $('<h5>').text(username);
							var $username = "You";
							var $message = message;

							console
									.log("connection status:"
											+ connectionStatus);

							$("#xe-body ul")
									.append(
											'<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/user-2.png"></a><div class="xe-comment"><strong>'
													+ $username
													+ '</strong></a><p>'
													+ $message
													+ '</p></div></div></li>');

						}, function() {
							alert('IM send failed');
						});
	}

	function sendFile() {
		var file = $('#chat-file')[0].files[0];
		// var sendTo = $('#chat-contacts').val();

		/**
		 * sendImWithFile(userName, file, success, failure) Sends a file via
		 * chat
		 * 
		 * @params <string> userName, <object> file, <function> success/failure
		 */
		kandy.messaging.sendImWithFile(sendTo, file, function() {

			// On successful send, append chat item to DOM
			var $chatItem = $('<div class="well text-right">')
			var $username = $('<h5>').text(username);
			var $file = $('<p>').text(file.name);

			$chatItem.append($username, $file);
			$('#chat-messages').append($chatItem);
		}, function() {
			alert('File send failed');
		});
	}

	// Event handler for messagesavailable
	// receive messages from other Kandy users
	function onMessagesAvailable() {

		/**
		 * getIm(success, failure) Retrieve any new instant messages (text,
		 * files, etc.)
		 * 
		 * @params <function> success/failure
		 */
		kandy.messaging
				.getIm(
						function(data) {

							// data object is an array of incoming messages sent
							// on successful getIM()
							// Iterate through data object & append messages to
							// DOM
							data.messages
									.forEach(function(msg) {

										if (msg.messageType == 'chat'
												&& msg.contentType === 'text'
												&& msg.message.mimeType == 'text/plain') {

											var $username = "Agent";
											var msgTxt = msg.message.text;
											var $message = msgTxt;
											var msgText = msg.message.text;
											var index = msgText
													.indexOf("VOICEMESSAGE");

											// to check to status whether he is
											// current customer in the call
											if (msgTxt == "CONNECTED") {
												connectionStatus = true;
												$("#queue_status").removeClass(
														"btn btn-info");
												$('#queue_status').addClass(
														'btn btn-success');
												$('#queue_status')
														.text(
																"Connected with Expert..");

											}
											if (msgTxt == "DISCONNECTED") {
												connectionStatus = false
												$("#queue_status").removeClass(
														"btn btn-success");
												$('#queue_status').addClass(
														'btn btn-info');
												$('#queue_status')
														.text(
																"Queue disconnected rejoin..");
											}
											console.log("connection status:"
													+ connectionStatus);

											if (msgText.indexOf("VOICEMESSAGE") == -1
													&& connectionStatus) {

												$("#xe-body ul")
														.append(
																'<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/cust_service.png"></a><div class="xe-comment"><strong>'
																		+ $username
																		+ '</strong></a><p>'
																		+ $message
																		+ '</p></div></div></li>');
											} else if (connectionStatus) {
												$message = msgTxt.substring(12);
												// $("#xe-body-voice2text
												// ul").append('<li><div
												// class="xe-comment-entry"><div
												// class="xe-comment"><strong>'+$username+'</strong></a><p>'+$message+'</p></div></div></li>');
												$("#xe-body-voice2text ul")
														.append(
																'<li>'
																		+ $username
																		+ ':<p>'
																		+ $message
																		+ '</p></li>');
											}

										}
										if (msg.messageType == 'chat'
												&& msg.contentType === 'file') {
											alert("file received");
											var $username = $('<h5>').text(
													msg.sender.user_id);
											var uuid = msg.message.content_uuid;
											var thumbnailURL = kandy.messaging
													.buildFileThumbnailUrl(uuid);
											var $fileName = $('<a>')
													.text(
															msg.message.content_name)
													.attr(
															{
																'href' : kandy.messaging
																		.buildFileUrl(uuid),
																'target' : '_blank'
															});
											var $file = $('<img>').attr('src',
													thumbnailURL).css('width',
													'20px');
											var $chatItem = $('<div class="well text-left">');

											$chatItem.append($username, $file,
													$fileName);
											$('#chat-messages').append(
													$chatItem);

											// $("#xe-body ul").append('<li><div
											// class="xe-comment-entry"><a
											// class="xe-user-img" href="#"><img
											// width="40" class="img-circle"
											// src="../assets/images/cust_service.png"></a><div
											// class="xe-comment"><strong>'+$username+'</strong></a><p>'+$file+'</p>'+$fileName+'</div></div></li>');
											$("#xe-body ul").append($chatItem);
										} else {
											// When the recieved messageType is
											// not chat, display message type
											console.log('received '
													+ msg.messageType + ': ');
										}
									});
						}, function() {
							alert('error recieving IMs');
						});

	}

	var userArray = [];

	// Event handler for login form button
	$('#support').on(
			'click',
			function(e) {
				e.preventDefault();

				$("#profile_section").hide(500);
				$("#chat_section").show(500);
				$("#title").hide();
				$("#support_queue_status").show();
				$("#support_queue_status").removeClass("hidden");

				// Values extracted from login form
				/*
				 * username = $('#username').val(); var apiKey =
				 * $('#api_key').val(); var password = $('#password').val();
				 */

				/**
				 * login(domainApiId, userName, password,success,failure) logs
				 * in user to Kandy Platform
				 * 
				 * @params <string> domainApiId, <string> userName, <string>
				 *         password, <function> success/failure
				 */
				kandy.login(apiKey, username, password, function(msg) {
					// IAMALIVE

					userArray.push(username);
					kandy.getLastSeen(userArray);
					UIState.authenticated();

					$('#current_customer_name').text(username);
					$('#current_customer_id').text(
							username + "@webrtc.techmahindra.com");
					sendAmAlive(username);
					// Checks every 5 seconds for incoming messages
					setInterval(receiveMessages, 5000);
				}, function(msg) {
					UIState.unauthenticated();
					alert('Login Failed!');
				});
			});

	// Event handler for logout button
	$('#logout-btn').on('click', function() {

		/**
		 * logout(success) logs a user out of the Kandy Platform
		 * 
		 * @param <function>
		 *            success - Callback handler for successful logout
		 */
		kandy.logout(function() {
			userArray.push(username);
			kandy.getLastSeen(userArray);
			UIState.unauthenticated();
		});
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

	// -------------- Video Audio -----------------
	// Event handler for callincoming event
	function onCallIncoming(call, isAnonymous) {
		$audioRingIn[0].play();
		callId = call.getId();

		if (!isAnonymous) {
			$('#username-incoming').text(call.callerName + ' Calling!');
		} else {
			$('#username-incoming').text('Anonymous Calling');
		}

		UIState.callincoming();
	}
	// Event handler for oncallanswered event
	function onCallAnswer(call) {
		callId = call.getId();

		$audioRingOut[0].pause();
		$audioRingIn[0].pause();

	}

	// Event handler for callansweredfailed event
	function onCallAnsweredFailed(call) {
		console.debug('callanswerfailed');
		callId = null;
	}

	// Event handler for callrejected event
	function onCallRejected() {
		console.debug('callrejected');
		callId = null;
		$audioRingIn[0].pause();
		UIState.callrejected();
		alert('Call Rejected');
	}

	// Event handler for callrejectfailed event
	function onCallRejectFailed() {
		console.debug('callrejectfailed');
		alert('Call Decline Failed');
	}
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
		kandy.call.holdCall(callId);
		UIState.holdcall();
	});

	$('#resume-call-btn').on('click', function() {
		kandy.call.unHoldCall(callId);
		UIState.resumecall();
	});

	// Event handler for call end button
	$('#end-call-btn').on('click', function() {
		kandy.call.endCall(callId);
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
	// Event handler for callincoming event
	function onCallIncoming(call, isAnonymous) {
		$audioRingIn[0].play();
		callId = call.getId();

		if (!isAnonymous) {
			$('#username-incoming').text(call.callerName + ' Calling!');
		} else {
			$('#username-incoming').text('Anonymous Calling');
		}

		UIState.callincoming();
	}

	// Event handler for oncallanswered event
	function onCallAnswer(call) {
		callId = call.getId();

		$audioRingOut[0].pause();
		$audioRingIn[0].pause();
	}

	// Event handler for callansweredfailed event
	function onCallAnsweredFailed(call) {
		console.debug('callanswerfailed');
		callId = null;
	}

	// Event handler for callrejected event
	function onCallRejected() {
		console.debug('callrejected');
		callId = null;
		$audioRingIn[0].pause();
		UIState.callrejected();
		alert('Call Rejected');
	}

	// Event handler for callrejectfailed event
	function onCallRejectFailed() {
		console.debug('callrejectfailed');
		alert('Call Decline Failed');
	}

	// Event handler for call answer button
	$('#answer-call-btn').on('click', function() {
		kandy.call.answerCall(callId, true);
		UIState.oncall();
	});

	// Event handler for call reject button
	$('#reject-call-btn').on('click', function() {
		kandy.call.rejectCall(callId);
		UIState.initial();
	});

	UIState.callincoming = function() {
		console.log('call incoming');

		$('#call-form, #call-connected').addClass('hidden');
		$('#incoming-call').removeClass('hidden');
	};

	UIState.callrejected = function() {
		console.log('call rejected');

		$('#incoming-call').addClass('hidden');
	};

	// ----------File upload script----------------

	var i = 1, $example_dropzone_filetable = $("#example-dropzone-filetable"), example_dropzone = $("#advancedDropzone").dropzone({
						url : 'data/upload-file.php',

						// Events
						addedfile : function(file) {
							alert("added new");
							// Script to send file

							kandy.messaging
									.sendImWithFile(
											sendTo,
											file,
											function() {

												// On successful send, append
												// chat item to DOM
												var $chatItem = $('<div class="well text-right">')
												var $username = $('<h5>').text(
														username);
												var $file = $('<p>').text(
														file.name);

												$chatItem.append($username,
														$file);
												$('#xe-body ul').append(
														$chatItem);
											}, function() {
												alert('File send failed');
											});

							// ----end

							if (i == 1) {
								$example_dropzone_filetable.find('tbody').html(
										'');
							}

							var size = parseInt(file.size / 1024, 10);
							size = size < 1024 ? (size + " KB") : (parseInt(
									size / 1024, 10) + " MB");

							var $entry = $('<tr>\
					<td class="text-center">'
									+ (i++)
									+ '</td>\
					<td>'
									+ file.name
									+ '</td>\
					<td><div class="progress progress-striped"><div class="progress-bar progress-bar-warning"></div></div></td>\
					<td>'
									+ size
									+ '</td>\
					<td>Uploading...</td>\
				</tr>');

							$example_dropzone_filetable.find('tbody').append(
									$entry);
							file.fileEntryTd = $entry;
							file.progressBar = $entry.find('.progress-bar');
						},

						uploadprogress : function(file, progress, bytesSent) {
							file.progressBar.width(progress + '%');
						},

						success : function(file) {

							file.fileEntryTd
									.find('td:last')
									.html(
											'<span class="text-success">Uploaded</span>');
							file.progressBar
									.removeClass('progress-bar-warning')
									.addClass('progress-bar-success');
						},

						error : function(file) {

							file.fileEntryTd
									.find('td:last')
									.html(
											'<span class="text-success">Uploaded</span>');
							file.progressBar
									.removeClass('progress-bar-warning')
									.addClass('progress-bar-success');
						}
					});

	$("#advancedDropzone").css({
		minHeight : 200
	});

	function sendAmAlive(e) {
		var message = "IAMALIVE";
		message = message + e;

		
		kandy.messaging.sendIm(sendTo, message, function() {

			console.log("AM alive sent success");
			$("#queue_status").removeClass("btn btn-success");
			$('#queue_status').addClass('btn btn-info');
			$('#queue_status').text("You are in the queue..");
		}, function() {
			alert('AM alive send failed');
		});
	}
	// -------------file upload end----------------

});

window.setInterval(function() {
	var elem = document.getElementById('xe-body');
	elem.scrollTop = elem.scrollHeight;
}, 5000);
