<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:dependencies></tags:dependencies>
</head>
<body>
	<tags:header />
	<table>
		<tr>
			<td>Hi Your Appointment has been schedule with executive on</td>
			<td><%=request.getAttribute("Time")%></td>
		</tr>
		<tr>
			<td>Please make note of this Event Id</td>
			<td><%=request.getAttribute("EventID")%></td>
		</tr>
	</table>
	<tags:footer />
</body>
</html>