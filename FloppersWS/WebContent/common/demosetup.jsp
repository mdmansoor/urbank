<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:dependencies>
</tags:dependencies>
<tags:script src="common/demosetup.js" />
</head>
<body>
	<tags:header />
	<div class="container">

		<div class="row">
			<hr>
			<div class="col-md-2">
				<tags:images src="agents/kathy.jpg" />
			</div>
			<div class="col-md-8">
				<h3>Agent</h3>
				<p>You can login as an agent and explore all agent features and
					can connect to the customer.</p>
				<button class="btn btn-primary pull-right" id="agent-btn">Agent
					Login</button>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-2">
				<tags:images src="agents/andrew.jpg" />
			</div>
			<div class="col-md-8">
				<h3>Customer</h3>
				<p>You can login as a customer and connect to the above agent.</p>
				<button class="btn btn-info pull-right" id="customer-btn">Customer
					Login</button>
			</div>
		</div>
		<hr>
	</div>
	<tags:footer />
</body>

</html>