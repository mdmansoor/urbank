$(function() {

	var listeners = {
		'onData' : onData,
		'onUserJoin' : onUserJoin,
		'onJoinApprove' : onJoinApprove,
		'onJoinReject' : onJoinReject,
		'onUserLeave' : onUserLeave,
		'onUserBoot' : onUserBoot,
		'onBoot' : onBoot,
		'onActive' : onActive,
		'onInactive' : onInactive,
		'onTermination' : onTermination
	};

	// Event handler for onJoinReject event
	function onJoinReject(notification) {
		$('#session-status').text("Participation rejected");
		loadSessionDetails();
	}

	// Event handler for onBoot event
	function onBoot(notification) {
		$('#session-status').text("You have been booted from session");
		loadSessionDetails();
	}

	var username;
	var sessions = [];
	var sessionListeners = [];

	// Event handler for onData event
	function onData(message) {
		$('#session-status').text(
				'Message Received: ' + JSON.stringify(message));
	}
	// Event handler for onUserJoin event
	function onUserJoin(notification) {
		$('#session-status').text('User Joined');
		loadSessionDetails();
	}
	// Event handler for onUserLeave event
	function onUserLeave(notification) {
		$('#session-status').text("User left");
		$('#session-actions)').addClass('hidden');
		loadSessionDetails();
	}
	// Event handler for onUserBoot event
	function onUserBoot(notification) {
		$('#session-status').text("Session User Boot");
		$('#session-actions)').addClass('hidden');
		loadSessionDetails();
	}
	// Event handler for onActive event
	function onActive(notification) {
		$('#session-status').text('Session activated');
		loadSessionDetails();
	}
	// Event handler for onInactive event
	function onInactive(notification) {
		$('#session-status').text('Session deactivated');
		loadSessionDetails();
	}
	// Event handler for onTermination event
	function onTermination(notification) {
		$('#session-status').text('Session Terminated');

		var deletedSessionId = notification.session_id;
		var indexOfSessionToDelete = sessions.map(function(sess) {
			return sess.session_id;
		}).indexOf(deletedSessionId);

		if (indexOfSessionToDelete > -1) {
			sessions.splice(indexOfSessionToDelete, 1);
		}
		loadSessionList(sessions, false);
	}

	// Event handler for onJoinApprove event
	function onJoinApprove(notification) {
		$('#session-status').text("Participation approved");
		loadSessionDetails();
	}

	// Function to load sessions list and append options to #sessions-select
	function loadSessionList(sessionList, alertWhenNone) {
		$('#sessions-select').empty();
		sessions = sessionList;
		if (sessionList.length > 0) {
			var i = 0;

			sessionList.forEach(function(session) {
				var $option = $('<option>').val(i).text(session.session_id);
				$('#sessions-select').append($option);
				i++;
			});

			loadSessionDetails();
		} else {
			UIState.sessionsunavailable();
			sessions = [];
			clearSessionDetails();

			if (alertWhenNone === undefined || alertWhenNone === null
					|| alertWhenNone) {
				$('#session-status').text('No sessions.');
			}
		}
	}

	// Function to get sessions that are created
	function getOpenSessions(alertWhenNone) {

		/**
		 * getOpenSessions(success, failure) Gets a list of all open sessions.
		 * 
		 * @params <function> success/failure
		 */
		KandyAPI.Session.getOpenSessions(function(result) {
			loadSessionList(result.sessions, alertWhenNone);
		}, function(msg, code) {
			$('#session-status').text(
					'Error getting session info(' + code + '): ' + msg);
			UIState.sessionsunavailable();
		});
	}

	// Function to update session details
	function updateSessionDetails(sess_id, sessionDetails) {
		var sess = null;
		var date = new Date();

		if (sess_id == sessionDetails.session_id) {

			// update session details in sessions array
			var sessionIndex = sessions.map(function(session) {
				return session.session_id;
			}).indexOf(sess_id);
			sessions[sessionIndex] = sessionDetails;
			sess = sessionDetails;

			$('#session-type').text(sess.session_type);
			$('#session-name').text(sess.session_name);
			$('#session-status-open').text(sess.session_status);
			$('#session-admin').text(sess.admin_full_user_id);
			$('#session-id').text(sess.session_id);
			$('#session-domain').text(sess.domain_name);

			if (sess.session_status != 'active') {
				UIState.sessionactivatebutton();
			} else {
				UIState.sessiondeactivatebutton();
			}

			date.setTime(sess.creation_timestamp);
			$('#session-created').text(date.toDateString());

			date.setTime(sess.expiry_timestamp);
			$('#session-expires').text(date.toDateString());
		}
		return sess;
	}

	// Function to clear session details
	function clearSessionDetails() {
		if (sessions.length) {
			$('#session-details li span').empty();
		}
	}

	// Event handler for login button
	$('#login-btn').on('click', function(e) {
		e.preventDefault();

		// Values extracted from login form
		username = $('#username').val();
		var apiKey = $('#api_key').val();
		var password = $('#password').val();

		/**
		 * login(domainApiId, userName, password) logs in user to Kandy Platform
		 * 
		 * @params <string> domainApiId, <string> userName, <string> password
		 */
		KandyAPI.login(apiKey, username, password, function(results) {
			$('#username').text(results.full_user_id);
			UIState.authenticated();
			setInterval(function() {
				if (sessions.length < 1) {
					getOpenSessions();
				}
			}, 3000);
			getOpenSessions();
		}, function(msg, code) {
			alert('Error loggin in:(' + code + '): ' + msg);
		});
	});

	$('#logout-btn').on('click', function(e) {
		e.preventDefault();

		/**
		 * logout(success, failure) logs out user from Kandy Platform
		 * 
		 * @params <function> success/failure
		 */
		KandyAPI.logout();
		UIState.unauthenticated();
	});

	// Event handler to load session details on change option
	$('#sessions-select').change(function() {
		loadSessionDetails();
	});

	// Event handler to send data to session participants
	$('#send-session-data-btn').on(
			'click',
			function() {

				/**
				 * sendData(sessionId, data, success, failure,
				 * destinationFullUserId) Sends data to all other participants.
				 * 
				 * @params <string> sessionId, <object> data, <function>
				 *         success/failure, <string> destinationFullUserId
				 */
				KandyAPI.Session.sendData(
						sessions[$('#sessions-select').val()].session_id, $(
								'#send-session-data').val(), function() {
							$('#session-status').text('Data sent');
							$('#send-session-data').val('');
						}, function(msg, code) {
							$('#session-status')
									.text(
											'Error sending Data (' + code
													+ '): ' + msg);
						});
			});

	// Function to load session details
	function loadSessionDetails() {
		var sessionId = sessions[$("#sessions-select").val()].session_id;
		var userStatus = [];

		/**
		 * getInfoById(sessionId, success, failure) : Void Gets session details
		 * by session ID.
		 * 
		 * @params <string> sessionId, <function> success/failure
		 */
		KandyAPI.Session.getInfoById(sessionId, function(result) {

			// Update session details
			var sess = updateSessionDetails(sessionId, result.session);
			var users = result.session.participants;
			var username = $('#username').text();

			$('#participants-list').empty();

			if (users.length < 1) {
				alert('You have no participants in this session!');
			} else {
				UIState.sessionsavailable();
				users
						.forEach(function(user) {
							var $li = $('<li>');

							if (user.full_user_id !== username) {
								var listText = user.full_user_id;
							} else {
								var listText = 'me';
							}

							listText += ' - ('
									+ user.type
									+ (user.type == 'admin' ? ''
											: ('/' + user.status)) + ')';
							$li.text(listText);
							$('#participants-list').append($li);

							if (user.full_user_id === username
									&& user.type === 'admin') {
								UIState.sessionadmin();
							} else if (user.full_user_id === username
									&& user.type === 'participant'
									&& user.status === 'approved') {
								UIState.sessionparticipant();
							} else if (user.full_user_id === username
									&& user.type === 'participant'
									&& user.status === 'pending') {
								UIState.sessionpendingparticipation();
							} else if (user.full_user_id !== username) {
								userStatus.push(user.full_user_id);
							}

							if (sessionListeners.indexOf(sess.session_id) < 0) {

								/**
								 * setListeners(sessionId, success, failure)
								 * Registers listener functions (called when
								 * session-related notifications are received).
								 * 
								 * @params <string> sessionId, <object>
								 *         sessionId
								 */
								KandyAPI.Session.setListeners(sess.session_id,
										listeners);
								sessionListeners.push(sess.session_id);
							}
						});

				if (users.length == userStatus.length) {
					UIState.sessionsavailable();
				}
			}
		}, function(msg, code) {
			$('#session-status').text(
					"Error getting participant information for this session.");
		});
	}

	// Event handler for session join button
	$('#session-join-btn').on(
			'click',
			function(e) {
				e.preventDefault();

				KandyAPI.Session.setListeners(sessions[$("#sessions-select")
						.val()].session_id, listeners);
				KandyAPI.Session.join(
						sessions[$("#sessions-select").val()].session_id, {
							user_nickname : $("#join_user_nickname").val(),
							user_first_name : $("#join_user_first_name").val(),
							user_last_name : $("#join_user_last_name").val(),
							user_phone_number : $("#join_user_phone_number")
									.val(),
							user_email : $("#join_user_email").val()
						}, function() {
							$('#session-status').text(
									"Session Join Requested: "
											+ sessions[$("#sessions-select")
													.val()].session_id);
							loadSessionDetails();
						}, function(msg, code) {
							$('#session-status').text(
									"Error joining session (" + code + "): "
											+ msg);
						});
			});

	// Event handler for session leave button
	$('#session-leave-btn').on(
			'click',
			function() {

				/**
				 * leave(sessionId, leaveReason, success, failure) : Void Leaves
				 * a session. To rejoin, the user must submit another join
				 * request.
				 * 
				 * @params <string> sessionId, <string> leaveReason, <function>
				 *         success/failure
				 */
				KandyAPI.Session.leave(
						sessions[$("#sessions-select").val()].session_id,
						"Let me outta here", function() {
							UIState.sessionsavailable();
							$('#session-status').text(
									"Session left.  ID = "
											+ sessions[$("#sessions-select")
													.val()].session_id);
							loadSessionDetails();
						}, function(msg, code) {
							$('#session-status').text(
									"Error leaving session (" + code + "): "
											+ msg);
						});
			});

	// Event handler for get open session button
	$('#open-sessions-btn').on('click', function() {
		getOpenSessions();
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

	UIState.sessionsunavailable = function() {
		$('#sessions-available').addClass('hidden');
		$('#sessions-unavailable').removeClass('hidden');
		$('#session-actions').addClass('hidden');
		$('#send-data').addClass('hidden');
		$('#session-join').addClass('hidden');
	}

	UIState.sessionsavailable = function() {
		$('#sessions-available').removeClass('hidden');
		$('#sessions-unavailable').addClass('hidden');
		$('#session-actions').addClass('hidden');
		$('#session-join').removeClass('hidden');
		$('#send-data').addClass('hidden');
	}

	UIState.sessionadmin = function() {
		$('#session-actions').removeClass('hidden');
		$('.admin').removeClass('hidden');
		$('#session-join').addClass('hidden');
		$('#send-data').removeClass('hidden');
	}

	UIState.sessionparticipant = function() {
		$('#send-data').removeClass('hidden');
		$('#session-join').addClass('hidden');
		$('#session-actions').removeClass('hidden');
	}

	UIState.sessionpendingparticipation = function() {
		$('#session-join').addClass('hidden');
		$('#send-data').addClass('hidden');
	}

	UIState.sessionactivatebutton = function() {
		$('#session-activate').addClass('hidden');
		$('#session-deactivate').removeClass('hidden');
		$('#send-data').addClass('hidden');
	}

	UIState.sessiondeactivatebutton = function() {
		$('#session-activate').addClass('hidden');
		$('#session-deactivate').removeClass('hidden');
		$('#send-data').addClass('hidden');
	}
});
