<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:dependencies></tags:dependencies>
<tags:script src="customer/scheduledmeeting.js" />
</head>
<body>
	<tags:header />
	<s:form action="scheduledmeeting">
		<tr>
			<tags:rowOdd>

				<td><label>Event ID</label></td>
				<td><input type="text" name="eventID" id="eventID"></td>
				<td><div id="eventID_error" class="level4_error">
						<s:fielderror fieldName="eventID" cssClass="level4_error">
						</s:fielderror>
					</div></td>
			</tags:rowOdd>
		</tr>
		<tags:rowEven>
			<tags:submitreset />
			<td></td>
		</tags:rowEven>
	</s:form>

	<tags:footer />
</body>
</html>