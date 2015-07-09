<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Xenon Boostrap Admin Panel" />
<meta name="author" content="" />

<title>UR Bank - Customer Banking</title>

<style>
#calendar_input {
	border: 1px solid #909090;
	font-family: Tahoma;
	font-size: 12px;
}

#calendar_icon {
	vertical-align: middle;
	cursor: pointer;
}
</style>
<tags:custdependencies></tags:custdependencies>
<tags:script src="customer/custapointmentbooking.js" />
</head>
<body class="page-body">



	<div class="page-container">
		<!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->

		<!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
		<!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
		<!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
		<div class="sidebar-menu toggle-others fixed">

			<div class="sidebar-menu-inner">

				<header class="logo-env">

					<!-- logo -->
					<div class="logo">
						<a href="dashboard-1.html" class="logo-expanded"> <img
							src="../assets/images/logo@2x.png" alt="" />
						</a> <a href="dashboard-1.html" class="logo-collapsed"> <img
							src="../assets/images/logo-collapsed@2x.png" width="40" alt="" />
						</a>
					</div>

					<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
					<div class="mobile-menu-toggle visible-xs">
						<a href="#" data-toggle="user-info-menu"> <i class="fa-bell-o"></i>
							<span class="badge badge-success">7</span>
						</a> <a href="#" data-toggle="mobile-menu"> <i class="fa-bars"></i>
						</a>
					</div>

					<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
					<div class="settings-icon">
						<a href="#" data-toggle="settings-pane" data-animate="true"> <i
							class="linecons-cog"></i>
						</a>
					</div>


				</header>


				<!-- Sidebar User Info Bar - Added in 1.3 -->
				<section class="sidebar-user-info">
					<div class="sidebar-user-info-inner">
						<a href="extra-profile.html" class="user-profile"> <img
							src="../assets/images/user-4.png" width="60" height="60"
							class="img-circle img-corona" alt="user-pic" /> <span> <strong><%=session.getAttribute("SESSION_USERNAME")%></strong>

						</span>
						</a>

						<ul class="user-links list-unstyled">
							<li class="active"><a href="custlanding!input"
								title="Edit profile" id="home_btn"> <i class="fa-home"></i>
									Home
							</a></li>
							<li><a href="mailbox-main.html" title="Mailbox"> <i
									class="linecons-mail"></i> Mailbox
							</a></li>
							<li class="logout-link"><a href="custlanding!logout"
								title="Log out"> <i class="fa-power-off"></i>
							</a></li>
						</ul>
					</div>
				</section>


				<ul id="main-menu" class="main-menu">
					<!-- add class "multiple-expanded" to allow multiple submenus to open -->
					<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
					<li>
						<ul>
							<li><a href="dashboard-1.html"> <span class="title">Dashboard
										1</span>
							</a></li>
							<li><a href="dashboard-2.html"> <span class="title">Dashboard
										2</span>
							</a></li>


						</ul>
					</li>
					<li>
						<ul>
							<li><a href="layout-variants.html"> <span class="title">Layout
										Variants &amp; API</span>
							</a></li>
							<li><a href="layout-collapsed-sidebar.html"> <span
									class="title">Collapsed Sidebar</span>
							</a></li>

						</ul>
					</li>
					<li>
						<ul>
							<li><a href="ui-panels.html"> <span class="title">Panels</span>
							</a></li>
							<li><a href="ui-buttons.html"> <span class="title">Buttons</span>
							</a></li>

						</ul>
					</li>
					<li></li>
					<li>
						<ul>
							<li><a href="" id="support"> <span class="title">Help</span></a></li>
							<li><a href="custlanding!appointment"> <span
									class="title">Book an Appointment</span></a></li>
							<li><a href=""> <span class="title">Scheduled
										Meeting</span></a></li>
						</ul>
					</li>

				</ul>

			</div>

		</div>

		<div class="main-content">

			<nav class="navbar user-info-navbar" role="navigation">
				<!-- User Info, Notifications and Menu Bar -->

				<!-- Left links for user info navbar -->
				<ul class="user-info-menu left-links list-inline list-unstyled">

					<li class="hidden-sm hidden-xs"><a href="#"
						data-toggle="sidebar"> <i class="fa-bars"></i>
					</a></li>

					<li class="dropdown hover-line"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa-envelope-o"></i> <span class="badge badge-green">15</span>
					</a>

						<ul class="dropdown-menu messages">
							<li>

								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">

									<li class="active">
										<!-- "active" class means message is unread --> <a href="#">
											<span class="line"> <strong>Luc Chartier</strong> <span
												class="light small">- yesterday</span>
										</span> <span class="line desc small"> This ain't our first
												item, it is the best of the rest. </span>
									</a>
									</li>

									<li class="active"><a href="#"> <span class="line">
												<strong>Salma Nyberg</strong> <span class="light small">-
													2 days ago</span>
										</span> <span class="line desc small"> Oh he decisively
												impression attachment friendship so if everything. </span>
									</a></li>

									<li><a href="#"> <span class="line"> Hayden
												Cartwright <span class="light small">- a week ago</span>
										</span> <span class="line desc small"> Whose her enjoy chief
												new young. Felicity if ye required likewise so doubtful. </span>
									</a></li>

									<li><a href="#"> <span class="line"> Sandra
												Eberhardt <span class="light small">- 16 days ago</span>
										</span> <span class="line desc small"> On so attention
												necessary at by provision otherwise existence direction. </span>
									</a></li>

									<!-- Repeated -->

									<li class="active">
										<!-- "active" class means message is unread --> <a href="#">
											<span class="line"> <strong>Luc Chartier</strong> <span
												class="light small">- yesterday</span>
										</span> <span class="line desc small"> This ain't our first
												item, it is the best of the rest. </span>
									</a>
									</li>

									<li class="active"><a href="#"> <span class="line">
												<strong>Salma Nyberg</strong> <span class="light small">-
													2 days ago</span>
										</span> <span class="line desc small"> Oh he decisively
												impression attachment friendship so if everything. </span>
									</a></li>

									<li><a href="#"> <span class="line"> Hayden
												Cartwright <span class="light small">- a week ago</span>
										</span> <span class="line desc small"> Whose her enjoy chief
												new young. Felicity if ye required likewise so doubtful. </span>
									</a></li>

									<li><a href="#"> <span class="line"> Sandra
												Eberhardt <span class="light small">- 16 days ago</span>
										</span> <span class="line desc small"> On so attention
												necessary at by provision otherwise existence direction. </span>
									</a></li>

								</ul>

							</li>

							<li class="external"><a href="mailbox-main.html"> <span>All
										Messages</span> <i class="fa-link-ext"></i>
							</a></li>
						</ul></li>

					<li class="dropdown hover-line"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa-bell-o"></i> <span class="badge badge-purple">7</span>
					</a>

						<ul class="dropdown-menu notifications">
							<li class="top">
								<p class="small">
									<a href="#" class="pull-right">Mark all Read</a> You have <strong>3</strong>
									new notifications.
								</p>
							</li>

							<li>
								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<li class="active notification-success"><a href="#"> <i
											class="fa-user"></i> <span class="line"> <strong>New
													user registered</strong>
										</span> <span class="line small time"> 30 seconds ago </span>
									</a></li>

									<li class="active notification-secondary"><a href="#">
											<i class="fa-lock"></i> <span class="line"> <strong>Privacy
													settings have been changed</strong>
										</span> <span class="line small time"> 3 hours ago </span>
									</a></li>

									<li class="notification-primary"><a href="#"> <i
											class="fa-thumbs-up"></i> <span class="line"> <strong>Someone
													special liked this</strong>
										</span> <span class="line small time"> 2 minutes ago </span>
									</a></li>

									<li class="notification-danger"><a href="#"> <i
											class="fa-calendar"></i> <span class="line"> John
												cancelled the event </span> <span class="line small time"> 9
												hours ago </span>
									</a></li>

									<li class="notification-info"><a href="#"> <i
											class="fa-database"></i> <span class="line"> The
												server is status is stable </span> <span class="line small time">
												yesterday at 10:30am </span>
									</a></li>

									<li class="notification-warning"><a href="#"> <i
											class="fa-envelope-o"></i> <span class="line"> New
												comments waiting approval </span> <span class="line small time">
												last week </span>
									</a></li>
								</ul>
							</li>

							<li class="external"><a href="#"> <span>View all
										notifications</span> <i class="fa-link-ext"></i>
							</a></li>
						</ul></li>

					<!-- Added in v1.2 -->
					<li class="dropdown hover-line language-switcher"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <img
							src="../assets/images/flags/flag-uk.png" alt="flag-uk" />
							English
					</a>

						<ul class="dropdown-menu languages">
							<li><a href="#"> <img
									src="../assets/images/flags/flag-al.png" alt="flag-al" />
									Shqip
							</a></li>
							<li class="active"><a href="#"> <img
									src="../assets/images/flags/flag-uk.png" alt="flag-uk" />
									English
							</a></li>
							<li><a href="#"> <img
									src="../assets/images/flags/flag-de.png" alt="flag-de" />
									Deutsch
							</a></li>
							<li><a href="#"> <img
									src="../assets/images/flags/flag-fr.png" alt="flag-fr" />
									Fran&ccedil;ais
							</a></li>
							<li><a href="#"> <img
									src="../assets/images/flags/flag-br.png" alt="flag-br" />
									Portugu&ecirc;s
							</a></li>
							<li><a href="#"> <img
									src="../assets/images/flags/flag-es.png" alt="flag-es" />
									Espa&ntilde;ol
							</a></li>
						</ul></li>

				</ul>


				<!-- Right links for user info navbar -->
				<ul class="user-info-menu right-links list-inline list-unstyled">
					<li class="search-form">
						<!-- You can add "always-visible" to show make the search input visible -->

						<form name="userinfo_search_form" method="get"
							action="extra-search.html">
							<input type="text" name="s" class="form-control search-field"
								placeholder="Type to search..." />

							<button type="submit" class="btn btn-link">
								<i class="linecons-search"></i>
							</button>
						</form>

					</li>

					<li class="dropdown user-profile"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <img
							src="../assets/images/user-4.png" alt="user-image"
							class="img-circle img-inline userpic-32" width="28" /> <span>
								<%=session.getAttribute("SESSION_USERID")%> <i
								class="fa-angle-down"></i>
						</span>
					</a>

						<ul class="dropdown-menu user-profile-menu list-unstyled">
							<li><a href="#edit-profile"> <i class="fa-edit"></i> New
									Post
							</a></li>
							<li><a href="#settings"> <i class="fa-wrench"></i>
									Settings
							</a></li>
							<li><a href="#profile"> <i class="fa-user"></i> Account
									Summary
							</a></li>
							<li><a href="#help"> <i class="fa-info"></i> Help
							</a></li>
							<li class="last"><a href="custlanding!logout"> <i
									class="fa-lock"></i> Logout
							</a></li>
						</ul></li>

					<li><a href="#" data-toggle="chat"> <i
							class="fa-comments-o"></i>
					</a></li>

				</ul>

			</nav>

			<div class="page-title">

				<div class="title-env">
					<h1 class="title">Account Summary</h1>
					<p class="description">User profile and story timeline</p>
				</div>

				<div class="breadcrumb-env">

					<ol class="breadcrumb bc-1">
						<li><i class="fa-home">Last Login Time :</i></li>
						<li><i><%=session.getAttribute("LASTLOGINTIME")%></i></li>

					</ol>

				</div>

			</div>

			<section class="profile-env" id="profile_section">
				<div class="col-sm-12">

					<div class="row">

						<div class="col-sm-3">

							<div data-easing="false" data-duration="3" data-suffix="k"
								data-to="117" data-from="1" data-count=".num"
								class="xe-widget xe-counter xe-counter-blue">
								<div class="xe-icon">
									<i class="fa-bank"></i>
								</div>
								<div class="xe-label">
									<strong class="num">1053 Rs</strong> <span>Current
										Balance</span>
								</div>
							</div>

						</div>
						<div class="col-sm-3">

							<div data-easing="true" data-duration="4" data-to="2470"
								data-from="1000" data-count=".num"
								class="xe-widget xe-counter xe-counter-info">
								<div class="xe-icon">
									<i class="fa-credit-card"></i>
								</div>
								<div class="xe-label">
									<strong class="num">14556</strong> <span>Credit Card
										Outstanding</span>
								</div>
							</div>

						</div>
						<div class="col-sm-3">

							<div data-delay="1" data-easing="true" data-duration="5"
								data-suffix="%" data-prefix="-," data-to="57" data-from="0"
								data-count=".num" class="xe-widget xe-counter xe-counter-red">
								<div class="xe-icon">
									<i class="fa-cubes"></i>
								</div>
								<div class="xe-label">
									<strong class="num">55000</strong> <span>Loan Amount</span>
								</div>
							</div>
						</div>
						<div class="col-sm-3">

							<div data-easing="false" data-duration="3" data-suffix="k"
								data-to="117" data-from="1" data-count=".num"
								class="xe-widget xe-counter xe-counter-blue">
								<div class="xe-icon">
									<i class="fa-calculator"></i>
								</div>
								<div class="xe-label">
									<strong class="num">6050 Rs</strong> <span>Outstanding
										Balance</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>

			<section>
				<div class="page-title">


					<div class="col-sm-12">
						<s:if test="hasActionMessages()">
							<div class="title-env">
								<h1 class="title">Booked Appoinment Detail</h1>
							</div>
							<s:actionmessage />
						</s:if>
						<s:else>

							<div class="title-env">
								<h1 class="title">Appoinment Detail</h1>
							</div>
						</s:else>
					</div>
				</div>
				<div class="page-title"></div>
				<s:form action="custapointmentbooking">
					<div class="col-sm-12">

						<tags:rowOdd>
							<td><label>Appointment Date</label></td>
							<td><input type="text" name="appointmentDate"
								id="appointmentDate"> <span><img
									id="appointmentDate_icon" src="../codebase/imgs/calendar.gif"
									border="0"></span></td>
							<td><div id="appointmentDate_error" class="level4_error">
									<s:fielderror fieldName="appointmentDate"
										cssClass="level4_error">
									</s:fielderror>
								</div></td>
						</tags:rowOdd>
						<tags:rowEven>
							<td><label>Time</label></td>
							<td><select id="hour" name="hour">
									<option value="">--- Please Select --</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">01</option>
									<option value="14">02</option>
									<option value="15">03</option>
									<option value="16">04</option>
									<option value="17">05</option>
							</select></td>
							<td><select id="minute" name="minute">
									<option value="">--- Please Select --</option>
									<option value="00">00</option>
									<option value="30">30</option>
							</select></td>

							<td><div id="hour_error" class="level4_error">
									<s:fielderror fieldName="hour" cssClass="level4_error">
									</s:fielderror>
								</div></td>
							<td><div id="minute_error" class="level4_error">
									<s:fielderror fieldName="minute" cssClass="level4_error">
									</s:fielderror>
								</div></td>
						</tags:rowEven>
						<tags:rowOdd>
							<td>Email address</td>
							<td><input type="text" id="emailID" name="emailID"></td>
							<td><div id="emailID_error" class="level4_error">
									<s:fielderror fieldName="emailID" cssClass="level4_error">
									</s:fielderror>
								</div></td>

						</tags:rowOdd>
						<tags:rowEven>
							<tags:submitreset />
							<td></td>
							<td></td>
							<td></td>
						</tags:rowEven>
					</div>
				</s:form>
			</section>



			<!-- Main Footer -->
			<!-- Choose between footer styles: "footer-type-1" or "footer-type-2" -->
			<!-- Add class "sticky" to  always stick the footer to the end of page (if page contents is small) -->
			<!-- Or class "fixed" to  always fix the footer to the end of page -->
			<footer class="main-footer sticky footer-type-1">

				<div class="footer-inner">

					<!-- Add your copyright text here -->
					<div class="footer-text">
						&copy; 2014 <strong>Floppers</strong> theme by <a
							href="http://laborator.co" target="_blank">Laborator</a> - <a
							href="http://themeforest.net/item/xenon-bootstrap-admin-theme/9059661?ref=Laborator"
							target="_blank">Purchase for only <strong>23$</strong></a>
					</div>


					<!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
					<div class="go-up">

						<a href="#" rel="go-top"> <i class="fa-angle-up"></i>
						</a>

					</div>

				</div>

			</footer>
		</div>
	</div>





</body>
</html>