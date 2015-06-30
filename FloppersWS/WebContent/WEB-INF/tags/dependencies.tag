<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%
	javax.servlet.http.HttpServletRequest _request = (javax.servlet.http.HttpServletRequest) request;
	String _path = _request.getContextPath();
%>
<title>Bank @ Doorstep | Home</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="hXd+vKEj5uvuJtnzkJRrU897Hm/f3sJd1VO7SEXrRHp8+TMT9DxbrRSPR6DNk8haOLUOY6Zn/kT/Sk3mM63+8A==" />
<link rel="shortcut icon" type="image/x-icon"
	href="http://dev.kandy.io:3000/assets/favicon-3da99d2536c9fa570157780f5d5f6f0d.ico" />

<!--Load Bootstrap CSS (optional)-->
<link rel="stylesheet" media="screen"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" media="screen"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />

<!--Load Kandy JS files (required - jQuery is required too!)-->
<script src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
<script
	src="https://kandy-portal.s3.amazonaws.com/public/javascript/fcs/3.0.4/fcs.js"></script>
<script
	src="https://kandy-portal.s3.amazonaws.com/public/javascript/kandy/2.2.2/kandy.js"></script>

<!--Load Pace AJAX Progress Bar (optional)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
<link rel="stylesheet" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/themes/pink/pace-theme-minimal.css" />
<link rel="stylesheet" type="text/css"
	href="../codebase/dhtmlxcalendar.css" />
<script src="../codebase/dhtmlxcalendar.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/css/common.css"
	type="text/css" />
<script type="text/javascript" src="<%=_path%>/common/js/common.js"></script>
