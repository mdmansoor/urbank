<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<div id='cssmenu'>
	<ul style="list-style-type: none;">
		<li class='active'><a href='#'>Account</a></li>
		<li><a href='#'>Fund Transfer</a></li>
		<li><a href='#'>Cards</a></li>
		<li><a href='#'>Loan</a></li>
		<li><a href='#'>Payments</a></li>
		<li><a href='#'>Offers</a></li>
		<li>Help
			<ul>
				<li><%=session.getAttribute("LASTLOGINTIME")%></li>
				<li>Subitem 2</li>
			</ul>
		</li>
		<ul>
			<li class="right"><b class="value"> &nbsp;<%=session.getAttribute("LASTLOGINTIME")%>
			</b></li>
			<li class="right"><b class="value"> &nbsp;<%=session.getAttribute("USER_NAME")%>
			</b></li>
		</ul>
	</ul>
</div>