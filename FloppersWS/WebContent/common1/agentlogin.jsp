<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tags:custdependencies></tags:custdependencies>
<tags:script src="common/agentlogin.js" />

</head>
<body>
	<div class="page-body login-page login-light">
		<div class="login-container">

			<div class="row">

				<div class="col-sm-offset-3 col-sm-6">



					<!-- Add class "fade-in-effect" for login form effect -->
		

					<s:form action="agentlogin" cssClass="login-form">
						<div class="login-header">
							<a href="custlogin.jsp" class="logo"> <img
								src="../assets/images/logo-white-bg@2x.png" alt="" />
							</a>
							<p>Dear user, log in with your credential</p>
						</div>


						<div class="form-group">
							<label class="control-label">UserID</label> <input type="text"
								class="form-control" name="username" id="username">
							<div id="username_error" class="level4_error">
								<s:fielderror fieldName="username" cssClass="level4_error">

								</s:fielderror>
							</div>

						</div>

						<div class="form-group">
							<label class="control-label">Password</label> <input 
								type="password" name="password" id="password" 
								class="form-control">
							<div id="password_error" class="level4_error">
								<s:fielderror fieldName="password" cssClass="level4_error">
								</s:fielderror>
							</div>

						</div>
						<div class="form-group">

							<button type="submit"
								class="btn btn-turquoise  btn-block text-left" name="btnSubmit"
								onclick=" return onSubmit()" id="btnSubmit">
								<i class=" fa-arrow-circle-o-right"></i> Login
							</button>
						</div>

						<div class="login-footer">
							<a href="#">Forgot your password?</a>

						</div>
					</s:form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>