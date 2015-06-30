$(document).ready(function() {
	$("#agent-btn").click(function() {
		window.open("agent.html", '_blank');
	});
	$("#customer-btn").click(function() {
		window.location.replace("../customer/customerlogin.jsp");
	});
});