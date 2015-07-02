<!DOCTYPE html>
<html>
<head>
<title>Kandy | Session Participation</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="ploHzS/U6EBH7NXst1Kp8VfpzkLvp9lZcD+O6gm+255Lg6k9q9OvlZgB1VzgSfpEMwVCXedV22HzScuNWJ60Mg==" />
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/favicon-3d48a59a912fb6c93201b5ad646b93ae.ico" />

<!--Load Bootstrap CSS (optional)-->
<link rel="stylesheet" media="screen"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" media="screen"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />

<!--Load Kandy JS files (required - jQuery is required too!)-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="https://kandy-portal.s3.amazonaws.com/public/javascript/fcs/3.0.1/fcs.js"></script>
<script
	src="https://kandy-portal.s3.amazonaws.com/public/javascript/kandy/2.1.1/kandy.js"></script>

<!--Load Pace AJAX Progress Bar (optional)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
<link rel="stylesheet" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/themes/pink/pace-theme-minimal.css" />


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2" id="activity-container">
				<div id="app-details">
					<h1 class="h2">Quick Start Sample App: Session Participation</h1>
					<p>This sample application demonstrates Session Participation</p>
				</div>

				<form id="login-form" class="simple_form form-horizontal"
					novalidate="novalidate" action="" accept-charset="UTF-8"
					method="post">
					<input name="utf8" type="hidden" value="&#x2713;" /><input
						type="hidden" name="authenticity_token"
						value="WhHZ3GKLEx9qZXW6B3pjTWuHkkQRM53zeyUK5i6zddW3yHcs5oxUyrWIdQpQYTD4D2seWxnBn8v4U0+Bf5MaeQ==" />
					<div class="form-group string required quick_start_login_api_key">
						<label class="string required col-sm-3 control-label"
							for="api_key"><abbr title="required">*</abbr> Project API
							Key</label>
						<div class="col-sm-9">
							<input id="api_key" name="api_key"
								class="string required form-control" type="text" />
						</div>
					</div>
					<div class="form-group string required quick_start_login_username">
						<label class="string required col-sm-3 control-label"
							for="username"><abbr title="required">*</abbr> Username</label>
						<div class="col-sm-9">
							<input id="username" name="username"
								class="string required form-control" type="text" />
						</div>
					</div>
					<div
						class="form-group password required quick_start_login_password">
						<label class="password required col-sm-3 control-label"
							for="password"><abbr title="required">*</abbr> Password</label>
						<div class="col-sm-9">
							<input id="password" name="password"
								class="password required form-control" type="password" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<input type="submit" name="commit" value="Login" id="login-btn"
								class="btn btn-success" />

						</div>
					</div>
				</form>
				<div class="hidden" id="logged-in">
					<hr />
					<div class="clearfix">
						<p class="h4 pull-left">
							<strong>Hello <span class="username"></span></strong>
						</p>
						<button class="btn btn-danger pull-right" id="logout-btn">Logout</button>
					</div>
					<hr />
					<button class="btn btn-default" id="open-sessions-btn">Get
						Open Sessions</button>
					<hr />
					<p>
						Status:<span id="session-status"></span>
					</p>
					<hr />
					<h3>Open Sessions:</h3>
					<p id="sessions-unavailable">No Sessions Loaded</p>

					<div id="sessions-available">
						<div class="form-group">
							<label for="sessions-select">Select Session</label> <select
								name="sessions-select" id="sessions-select" class="form-control"></select>

						</div>
						<hr />
						<h4>Session Details</h4>
						<ul class="list-unstyled" id="session-details">
							<li>Type:<span id="session-type"></span>
							</li>
							<li>Name:<span id="session-name"></span>
							</li>
							<li>Status:<span id="session-status-open"></span>
							</li>
							<li>Created:<span id="session-created"></span>
							</li>
							<li>Expires:<span id="session-expires"></span>
							</li>
							<li>Admin:<span id="session-admin"></span>
							</li>

							<hr />
						</ul>
						<h4>Participants</h4>
						<ul class="list-unstyled" id="participants-list"></ul>
						<hr />
					</div>
					<div class="hidden" id="session-actions">
						<div class="btn-toolbar"></div>
						<hr />
					</div>
					<div class="hidden" id="send-data">
						<div class="form-group">
							<label for="send-session-data">Data To Send</label> <input
								type="text" name="send-session-data" id="send-session-data"
								class="form-control" />

						</div>
						<button class="btn btn-success" id="send-session-data-btn">Send
							Data</button>
					</div>
					<div id="session-join">
						<h4>Join Session</h4>
						<form id="session-join-form" action="" accept-charset="UTF-8"
							method="post">
							<input name="utf8" type="hidden" value="&#x2713;" /><input
								type="hidden" name="authenticity_token"
								value="fGyC4xdneWiH/EciyRRUNeMLR0WwMJ1g7FMbmEi4oxuRtSwTk2A+vVgRR5KeDweAh+fLWrjCn1hvJV7/GZjMtw==" />

							<div class="form-group">
								<label for="join_user_nickname">Join user nickname</label> <input
									type="text" name="join_user_nickname" id="join_user_nickname"
									class="form-control" />

							</div>
							<div class="form-group">
								<label for="join_user_first_name">Join user first name</label> <input
									type="text" name="join_user_first_name"
									id="join_user_first_name" class="form-control" />

							</div>
							<div class="form-group">
								<label for="join_user_last_name">Join user last name</label> <input
									type="text" name="join_user_last_name" id="join_user_last_name"
									class="form-control" />

							</div>
							<div class="form-group">
								<label for="join_user_phone_number">Join user phone
									number</label> <input type="text" name="join_user_phone_number"
									id="join_user_phone_number" class="form-control" />

							</div>
							<div class="form-group">
								<label for="join_user_email">Join user email</label> <input
									type="text" name="join_user_email" id="join_user_email"
									class="form-control" />

							</div>
							<div class="form-group">
								<button class="btn btn-success" id="session-join-btn">Join
									Selected Session</button>
							</div>
						</form>
					</div>
					<hr />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
