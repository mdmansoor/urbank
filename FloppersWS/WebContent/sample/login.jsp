<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<tags:dependencies>
</tags:dependencies>
<tags:script src="sample/login.js" />

</head>
<body onload="doonload()">
	<tags:header />
	<input type="hidden" name="api_key" id="api_key"
		value=<%=request.getAttribute("apikey")%>>
	<input type="hidden" name="username" id="username"
		value=<%=request.getAttribute("kandyusername")%>>
	<input type="hidden" name="password" id="password"
		value=<%=request.getAttribute("kandyuserpassword")%>>
	<input type="hidden" name="agent" id="agent"
		value=<%=request.getAttribute("agent")%>>
	<div class="hidden" id="logged-in">

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
				<button class="btn btn-danger" id="end-call-btn">End Call</button>
				<button class="btn btn-warning" id="hold-call-btn">Hold
					Call</button>
				<button class="btn btn-success hidden" id="resume-call-btn">Resume
					Call</button>
			</div>
		</div>
	</div>
	<div id="row">
		<div id="chat-container" class="hidden">
			<div id="chat-disp" class="col-xs-4"
				style="word-break: 200px; height: 400px; overflow-y: auto;">
				<label for="chat-messages" class="bg-warning">Chat message:</label>
				<div id="chat-messages" class="bg-info"></div>
			</div>
			<div id="chat-input" class="col-xs-4">

				<div class="form-group">
					<label for="chat-message">Message:</label>
					<div class="form-group_chat">

						<textarea name="chat-message" id="chat-message"
							class="form-control">
								</textarea>
					</div>
					<div class="form-group_file">
						<input type="file" name="chat-file" id="chat-file"
							style="display: none;" class="form-control" />

					</div>
					<input type="button" onclick="fileupload()" value="File Share"
						id="fileupload"> <input type="button" onclick="message()"
						value="Message" id="message" style="display: none;">
				</div>
				<button name="button" type="submit" class="btn btn-primary"
					id="chat-btn" onclick="sendMessage()">Send</button>

			</div>
		</div>
	</div>

</body>
<tags:footer />
</html>