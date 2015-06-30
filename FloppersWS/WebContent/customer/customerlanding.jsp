<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:dependencies>
</tags:dependencies>
<tags:script src="customer/customerlanding.js" />
</head>
<body>

	<tags:header />
	<tags:menu></tags:menu>
	<button id="support-btn" onclick="onscheduled()"
		value="Have an appointment" style="size: 10px;"></button>
	<div class="row">
		<div class="col-md-11">
			<button class="btn btn-primary pull-right" id="appoint-btn"
				onclick="onappointment()">
				<div class="help">
					<tags:images src="agents/appointment.png" />
				</div>
			</button>
		</div>
		<div class="col-md-12">
			<button class="btn btn-primary pull-right" id="support-btn"
				onclick="onSupport()">
				<div class="help">
					<tags:images src="agents/cslogo.jpg" />
				</div>
			</button>
		</div>

	</div>
	<tags:footer />
</body>
</html>