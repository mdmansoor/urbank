<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:dependencies>
</tags:dependencies>
<tags:script src="customer/customerlogin.js" />
</head>
<body>
	<tags:header />
	<div class="body">
		<s:form action="customerlogin">
			<table style="width: 500px;height: 156px;">
			<tr>
				<tags:rowOdd>

					<td><label>Username</label></td>
					<td><input type="text" name="username" id="username"></td>
					<td><div id="username_error" class="level4_error">
							<s:fielderror fieldName="username" cssClass="level4_error">

							</s:fielderror>
						</div></td>
				</tags:rowOdd>
			</tr>
			<tr>
				<tags:rowEven>
					<td><label>Password</label></td>
					<td><input type="password" name="password" id="password"></td>
					<td><div id="password_error" class="level4_error">
							<s:fielderror fieldName="password" cssClass="level4_error">
							</s:fielderror>
						</div></td>
				</tags:rowEven>
			</tr>
			<tr>
				<tags:submitreset />
			</tr>
			</table>
		</s:form>
	</div>

</body>
<tags:footer />
</html>