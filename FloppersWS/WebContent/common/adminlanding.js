$(function() {
	// initial configurations
	login();
	var sendTo = "";
	var username = '';
	var userArray = [];
	var apiKey = '';
	var language = "English";
	$("#profile_section").hide();
	$("#chat_section").show();
	$('#btn_get_customer').removeClass('btn btn-danger');
	$('#btn_get_customer').addClass('btn btn-success');
	$('#btn_get_customer').text('Get next customer from queue');
	var connectionStatus = false;
	var currentUser = "";
	var domainName=$('#domainName').val();
	

	$("#home_btn").click(function() {

		$("#profile_section").hide(500);
		$("#chat_section").show(500);

	});

	function login() {
		username = $('#adminUserName').val();

		apiKey = $('#api_key').val();
		password = $('#password').val();
		console.log("agent login with id:" + username);

		kandy.login(apiKey, username, password, function(msg) {

			userArray.push(username);
			kandy.getLastSeen(userArray);
			UIState.authenticated();

			// Checks every 5 seconds for incoming messages
			setInterval(receiveMessages, 5000);
		}, function(msg) {
			UIState.unauthenticated();
			alert('Login Failed!');
		});

	}

	// Event handler for send message button
	$('#chat-btn').on('click', function() {

		if (connectionStatus) {
			sendMessage();
		} else {
			alert("Please select a customer !!");
		}

	});
	$('#file-btn').on('click', function() {
		sendFile();
	});

	$('#user_queue a.queue')
			.live(
					'click',
					function() {
						if (connectionStatus) {
							alert("Please disconnect the current user before select the next customer!!");
						} else {
							// alert($(this).text());
							currentUser = $(this).text();
							$('#btn_get_customer').addClass('btn btn-danger');
							$('#btn_get_customer').removeClass(
									'btn btn-success');
							$('#btn_get_customer').text(
									'Disconnect Current Customer');
							$('#current_customer_name').text(currentUser);
							$('#current_customer_id').text(
									currentUser + '@' + domainName);
							$('#user_to_call').text(
									currentUser + '@' + domainName);
							$('#user_to_call').val(
									currentUser + '@' + domainName);
							sendTo = currentUser + '@' + domainName;
							console.log("user to call:" + currentUser);
							$(this).parent().remove();
							connectionStatus = true;
							sendConnectionStatus(true, currentUser);

						}
					});

	$('#start_videocall_btn').on('click', function() {

	});

	$('#btn_get_customer').on(
			'click',
			function() {
				// alert("disconnected");

				if (connectionStatus) {
					console.log("disconnected");
					$('#btn_get_customer').removeClass('btn btn-danger');
					$('#btn_get_customer').addClass('btn btn-success');
					$('#btn_get_customer').text('Get Next Customer');
					var chat = $("#xe-body-voice2text").html();
					// alert(chat);
					connectionStatus = false;
					var xmlHttp = new XMLHttpRequest();
					var currentText = strip(chat);
					xmlHttp.open("post", "../VoiceCustomerServlet", true);
					// alert("get executed");
					xmlHttp.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");

					xmlHttp.send("final_span=" + currentText + "&username="
							+ currentUser);
					sendConnectionStatus(false, currentUser);

				} else {
					alert("Please select next customer from queue!!");
				}

				// alert("get sent");
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
		console.log('sendig message to:' + sendTo + ":" + message);
		kandy.messaging
				.sendIm(
						sendTo,
						message,
						function() {

							// On successful send, append chat item to DOM

							// var $username = $('<h5>').text(username);
							var $username = "You";
							var $message = message;
							// $('#xe-body ul').append('<li>Hi test</li>');;

							$("#xe-body ul")
									.append(
											'<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/cust_service.png"></a><div class="xe-comment"><strong>'
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
			var $chatItem = $('<div class="well text-right">');
			var $username = $('<h5>').text(username);
			var $file = $('<p>').text(file.name);

			$chatItem.append($username, $file);
			$('#xe-body ul').append($chatItem);
		}, function() {
			alert('IM send failed');
		});
	}

	function sendConnectionStatus(status, currentUser) {

		var message = "DISCONNECTED";
		if (status) {
			message = "CONNECTED";
		} else {
			message = "DISCONNECTED";
		}

		var to = currentUser + "@" + domainName;
		console.log("To:" + to);
		console.log("sendTo:" + sendTo);
		kandy.messaging.sendIm(sendTo, message, function() {
			console.log("Send Connection status to " + sendTo + " success");

		}, function() {
			alert('Connection sending failed');
			console.log("Send Connection status to " + sendTo + " failed");
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

											var $username = "Customer";
											var msgChat = msg.message.text;
											var msgTxt = msg.message.text;
											var $message = msgTxt.substring(12);
											// $('#xe-body ul').append('<li>Hi
											// test</li>');;
											// $("#xe-body ul").append('<li><div
											// class="xe-comment-entry"><a
											// class="xe-user-img" href="#"><img
											// width="40" class="img-circle"
											// src="../assets/images/user-2.png"></a><div
											// class="xe-comment"><strong>'+$username+'</strong></a><p>'+$message+'</p></div></div></li>');

											var msgText = msg.message.text;

											var index = msgText
													.indexOf("VOICEMESSAGE");
											console.log(index);
											console.log(msgText);

											if (msgText.indexOf("VOICEMESSAGE") == -1
													&& msgText
															.indexOf("IAMALIVE") == -1
													&& msgText
															.indexOf("LANGUAGE") == -1) {
												console
														.log("Chat Message received");
												// update chat window
												$("#xe-body ul")
														.append(
																'<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/user-2.png"></a><div class="xe-comment"><strong>'
																		+ $username
																		+ '</strong></a><p>'
																		+ msgText
																		+ '</p></div></div></li>');
											} else if (msgText
													.indexOf("VOICEMESSAGE") != -1
													&& msgText
															.indexOf("IAMALIVE") == -1
													&& msgText
															.indexOf("LANGUAGE") == -1) {
												// update voice to text
												console
														.log("voice to text received");
												$("#xe-body-voice2text ul")
														.append(
																'<li>'
																		+ $username
																		+ ':<p>'
																		+ $message
																		+ '</p></li>');
											} else if (msgText
													.indexOf("VOICEMESSAGE") == -1
													&& msgText
															.indexOf("IAMALIVE") != -1
													&& msgText
															.indexOf("LANGUAGE") == -1) {
												// update customer queue
												// <li><a class="queue"
												// href"#">customer1</a></li>
												console
														.log("user available status received");
												var user = msgText.substring(8);
												$("#user_queue_container ul")
														.append(
																'<li><a class="queue" href="#">'
																		+ user
																		+ '</a></li>');

											}

											else if (msgText
													.indexOf("VOICEMESSAGE") == -1
													&& msgText
															.indexOf("IAMALIVE") == -1
													&& msgText
															.indexOf("LANGUAGE") != -1) {
												// update customer queue
												// <li><a class="queue"
												// href"#">customer1</a></li>

												language = msgText.substring(8);

												$('#user_language').text(
														language);
												$('#user_language').val(
														language);

												if (language == 'Hindi') {
													console.log()
													$('#user_language_code')
															.val('hi-IN');
												} else if (language == 'English') {
													$('#user_language_code')
															.val('en-US');
												} else if (language == 'French') {
													$('#user_language_code')
															.val('fr-FR');
												} else if (language == 'Chinese') {
													$('#user_language_code')
															.val('zh-CN');
												}

												var langCode = $(
														'#user_language_code')
														.val();
												console
														.log("LANGUAGE  received:"
																+ language);
												console
														.log("LANGUAGE  code  set:"
																+ langCode);

											}

										}
										if (msg.messageType == 'chat'
												&& msg.contentType === 'file') {
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
											// class="xe-comment-entry"><img
											// width="40" class="img-circle"
											// src="../assets/images/cust_service.png"><div
											// class="xe-comment"><strong>'+$username+'</strong><p>'+$file+'</p>'+$fileName+'</div></div></li>');
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

	var UIState = {};

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

	// -----------File Upload Script ----

	var i = 1, $example_dropzone_filetable = $("#example-dropzone-filetable"), example_dropzone = $(
			"#advancedDropzone")
			.dropzone(
					{
						url : 'data/upload-file.php',

						// Events
						addedfile : function(file) {
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
												$('#chat-messages').append(
														$chatItem);
											}, function() {
												alert('IM send failed');
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
											'<span class="text-success">success</span>');
							file.progressBar
									.removeClass('progress-bar-warning')
									.addClass('progress-bar-success');
						}
					});

	$("#advancedDropzone").css({
		minHeight : 200
	})

	// --------- file upload end ---------

	function voiceToTextFile() {
		// xe-body-voice2text
		// btn_get_customer
		// alert("disconnected");
		$('#btn_get_customer').removeClass('btn btn-danger');
		$('#btn_get_customer').addClass('btn btn-success');
		$('#btn_get_customer').text('Get Next Customer');
		var chat = $("#xe-body-voice2text").html();
		// alert(chat);
		connectionStatus = false;
		var xmlHttp = new XMLHttpRequest();
		var currentText = strip(chat);
		xmlHttp.open("post", "../VoiceCustomerServlet", true);
		// alert("get executed");
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		xmlHttp.send("final_span=" + currentText + "&username=" + username);
		// alert("get sent");

	}

	// ---- Call Handler ----------------------

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
		var tousername = $('#user_to_call').val();

		/**
		 * makeCall( userName, cameraOn ) : Void Initiates a call to another
		 * Kandy user over web
		 * 
		 * @params <string> userName, <boolean> cameraOn
		 */
		KandyAPI.Phone.makeCall(tousername, true);
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

	// --------- call handler end -----------------

});

window.setInterval(function() {
	var elem = document.getElementById('xe-body');
	elem.scrollTop = elem.scrollHeight;
}, 5000);

function strip(html) {
	var tmp = document.createElement("DIV");
	tmp.innerHTML = html;
	return tmp.textContent || tmp.innerText || "";
}