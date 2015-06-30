<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<tags:dependencies></tags:dependencies>
<tags:script src="customer/cscustomer.js" />
</head>
<body>
	<tags:header />
	<div class="container">
		<div class="row">
			<div class="col-xs-8" id="activity-container">


				<div class="row">
					<div class="col-xs-offset-2">
						<form id="login-form" class="simple_form form-horizontal"
							novalidate="novalidate" action="" accept-charset="UTF-8"
							method="post">
							<input name="utf8" type="hidden" value="&#x2713;" /><input
								type="hidden" name="authenticity_token"
								value="OlargpQtQGzKE+3wa9sKoPyc6HIeZ9GMmL1fUGlfwejD2OYtwTL9KjC6c6M23KmpC1L4fmfe7ZWypKn+Hxl7Yg==" />
							<br> <br> <br> <br>
							<h4>Login as Customer, Click login button</h4>
							<div class="form-group string required quick_start_login_api_key">
								<label class="string required col-sm-3 control-label hidden"
									for="api_key"><abbr title="required">*</abbr> Project
									API Key</label>
								<div class="col-sm-9">
									<input id="api_key" name="api_key"
										class="string required form-control hidden" type="text"
										value="DAK5aa3e878df1d46ca9f83e27ad0dfba1f" />
								</div>
							</div>
							<div
								class="form-group string required quick_start_login_username">
								<label class="string required col-sm-3 control-label"
									for="username"><abbr title="required">*</abbr> Username</label>
								<div class="col-sm-9">
									<input id="username" name="username"
										class="string required form-control" type="text"
										value="customer1" disabled />
								</div>
							</div>
							<div
								class="form-group password required quick_start_login_password">
								<label class="password required col-sm-3 control-label"
									for="password"><abbr title="required">*</abbr> Password</label>
								<div class="col-sm-9">
									<input id="password" name="password"
										class="password required form-control" type="password"
										value="reset@123" disabled />
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<input type="submit" name="commit" value="Login" id="login-btn"
										class="btn btn-success" />

								</div>
							</div>
						</form>
					</div>
				</div>


				<div class="hidden" id="logged-in">
					<hr />
					<div class="clearfix">
						<p class="h4 pull-left">
							<strong>Hello <span class="username"></span></strong>
						</p>
						<button class="btn btn-danger pull-right" id="logout-btn">Logout</button>
					</div>
					<hr />
					<div id="video-container">
						<h3>Video</h3>
						<div class="row">
							<div class="col-sm-6">
								<div class="video" id="incoming-video"></div>
							</div>
							<div class="col-sm-6">
								<div class="video" id="outgoing-video"></div>
							</div>
						</div>
					</div>
					<hr />
					<div class="hidden" id="incoming-call">
						<h4>Incoming Call</h4>
						<p id="username-incoming"></p>
						<div class="btn-toolbar">
							<button class="btn btn-success" id="answer-call-btn">Answer
								Call</button>
							<button class="btn btn-warning" id="reject-call-btn">Reject
								Call</button>
						</div>
					</div>
					<div class="hidden" id="call-connected">
						<h4>Call Connected</h4>
						<p id="username-connected"></p>
						<div class="btn-toolbar">
							<button class="btn btn-danger" id="end-call-btn">End
								Call</button>
							<button class="btn btn-warning" id="hold-call-btn">Hold
								Call</button>
							<button class="btn btn-success hidden" id="resume-call-btn">Resume
								Call</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="row">
			<div id="chat-container" class="hidden">


				<div class="col-xs-4">
					<label for="chat-messages" class="bg-warning">Chat message:</label>
					<div id="chat-messages" class="bg-info"></div>
				</div>

				<div id="chat-input" class="col-xs-4">
					<div class="form-group">
						<label for="chat-contacts">Select Customer to send message</label>
						<select name="chat-contacts" id="chat-contacts"
							class="form-control"></select>

					</div>
					<div class="form-group">
						<label for="chat-message">Message:</label>
						<textarea name="chat-message" id="chat-message"
							class="form-control">
								</textarea>

					</div>
					<button name="button" type="submit" class="btn btn-primary"
						id="chat-btn">Send</button>

				</div>
			</div>
		</div>
	</div>
</body>
<tags:footer />
</html>
