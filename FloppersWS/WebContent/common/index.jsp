<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:dependencies></tags:dependencies>
<tags:script src="common/index.js" />
</head>
<body>
	<tags:header />
	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2" id="activity-container">

				<br> <br> <br> <br>

				<div id="logged-in">
					<hr />
					<div class="clearfix">
						<p class="h4">To test this WebRTC Banking Feature with
							predefined Banker and Customer credentials</p>
						<button class="btn btn-primary pull-right" id="demo-btn">Banking
							Feature Demo</button>
					</div>
					<hr />

				</div>
				<div id="logged-in">
					<hr />
					<div class="clearfix">
						<p class="h4">To setup Banking for your own banker and
							customer credentials</p>
						<button class="btn btn btn-warning pull-right" id="setup-btn">Setup
							your account</button>
					</div>
					<hr />

				</div>
			</div>
		</div>
	</div>
	<tags:footer />
</body>
</html>