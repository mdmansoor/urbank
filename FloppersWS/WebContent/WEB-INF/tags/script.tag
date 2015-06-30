<%@tag body-content="empty"%>
<%@attribute name="src" required="true" rtexprvalue="true"%>
<%
javax.servlet.http.HttpServletRequest _request = (javax.servlet.http.HttpServletRequest) request;
String _path = _request.getContextPath();
%>
<script type="text/javascript" src="<%=_path%>/${src}"></script>