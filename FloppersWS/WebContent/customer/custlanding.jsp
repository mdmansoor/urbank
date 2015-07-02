<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Xenon Boostrap Admin Panel" />
<meta name="author" content="" />

<title>UR Bank - Customer Banking</title>

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
<link rel="stylesheet"
	href="../assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet"
	href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="../assets/css/xenon-core.css">
<link rel="stylesheet" href="../assets/css/xenon-forms.css">
<link rel="stylesheet" href="../assets/css/xenon-components.css">
<link rel="stylesheet" href="../assets/css/xenon-skins.css">
<link rel="stylesheet" href="../assets/css/custom.css">
<link rel="stylesheet" href="../common/css/common.css">
<script src="../assets/js/jquery-1.11.1.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->


<!-- Kandy API includes -->

<script
	src="https://kandy-portal.s3.amazonaws.com/public/javascript/fcs/3.0.4/fcs.js"></script>
<script
	src="https://kandy-portal.s3.amazonaws.com/public/javascript/kandy/2.2.2/kandy.js"></script>

<!--Load Pace AJAX Progress Bar (optional)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
<link rel="stylesheet" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/themes/pink/pace-theme-minimal.css" />

<!-- Kandy END -->


<tags:script src="customer/custlanding.js" />
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
							<li class="active"><a href="#" title="Edit profile"
								id="home_btn"> <i class="fa-home"></i> Home
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
					<li><a href="dashboard-1.html"> <i class="linecons-cog"></i>
							<span class="title">Account</span>
					</a>
						<ul>
							<li><a href="dashboard-1.html"> <span class="title">Dashboard
										1</span>
							</a></li>
							<li><a href="dashboard-2.html"> <span class="title">Dashboard
										2</span>
							</a></li>


						</ul></li>
					<li><a href="layout-variants.html"> <i
							class="linecons-desktop"></i> <span class="title">Fund
								Transfer</span>
					</a>
						<ul>
							<li><a href="layout-variants.html"> <span class="title">Layout
										Variants &amp; API</span>
							</a></li>
							<li><a href="layout-collapsed-sidebar.html"> <span
									class="title">Collapsed Sidebar</span>
							</a></li>

						</ul></li>
					<li><a href="ui-panels.html"> <i class="linecons-note"></i>
							<span class="title">Credit Cards</span>
					</a>
						<ul>
							<li><a href="ui-panels.html"> <span class="title">Panels</span>
							</a></li>
							<li><a href="ui-buttons.html"> <span class="title">Buttons</span>
							</a></li>

						</ul></li>
					<li><a href="ui-widgets.html"> <i class="linecons-star"></i>
							<span class="title">Loan</span>
					</a></li>
					<li><a href="#" id="support"> <i class="linecons-note"></i>
							<span class="title">Support</span>
					</a></li>

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
			<section class="profile-env" id="chat_section">

				<div class="row">
					<div class="col-sm-6" id="activity-container">
					<!--Chat design  -->
					<div class="xe-widget xe-conversations">
					<div class="xe-bg-icon">
							<i class="linecons-comment"></i>
						</div>
						<div class="xe-header">
							<div class="xe-icon">						
								<i class="linecons-comment"></i>
							</div>
							<div class="xe-label">
								<h3>
									Conversations
									<small>Chatting arround</small>
								</h3>
							</div>
						</div>
						<div class="xe-body  widget-scroll" id="xe-body" >
							<!-- chat to be added dynamically -->
							<ul class="list-unstyled" id="chatItem">
							
							</ul>
						</div>						
					</div>					

						<div class="hidden" id="logged-in">							
							<div id="chat-container">																
								<div id="chat-input">									
									<div class="form-group">
										<label for="chat-message">Chat Message</label>
										<input type="text" name="chat-message" id="chat-message"
											class="form-control">									
									</div>
									<button name="button" type="submit" class="btn btn-success"
										id="chat-btn">Send</button>

								</div>
							</div>
						</div>
					</div>
					
					<!-- Video Call -->
					 <div class="col-sm-6" id="activity-container">
          
          
          
          <div id="logged-in">           
            <div class="xe-widget xe-conversations">
						<div class="xe-bg-icon">
								<i class="linecons-comment"></i>
						</div>
						<div class="xe-header">
							<div class="xe-icon">						
								<i class="linecons-comment"></i>
							</div>
							<div class="xe-label">
								<h3>
									Video
										<small>Video call with bank executive</small>
								</h3>
							</div>
						</div>
						<div class="xe-body video-scroll" id="xe-body" >
								<!-- chat to be added dynamically -->
							<div class="row">
				                <div class="col-sm-10">
				                <center>
				                  <div class="video" id="incoming-video"></div>
				                 </center>
				                </div>
				                <!-- <div class="col-sm-6">
				                  <div class="video" id="outgoing-video"></div>
				                </div> -->
				              </div>
							</div>
            </div>
            <hr /><div class="hidden" id="incoming-call">
              <h4>
                Incoming Call
              </h4>
              <p id="username-incoming"></p>
              <div class="btn-toolbar">
                <button class="btn btn-success col-sm-5" id="answer-call-btn">Answer Call</button><button class="btn btn-warning col-sm-5" id="reject-call-btn">Reject Call</button>
              </div>
            </div><div class="hidden" id="call-connected">
              <h4>
                Call Connected
              </h4>
              <p id="username-connected"></p>
              <div class="btn-toolbar">
                <button class="btn btn-danger col-sm-5" id="end-call-btn">End Call</button><button class="btn btn-warning col-sm-5" id="hold-call-btn">Hold Call</button><button class="btn btn-success hidden col-sm-5" id="resume-call-btn">Resume Call</button>
              </div>
            </div>
          </div>
          
          
          
          
        </div>
		
					<!-- video call end -->
					
					
					<!-- File sharing -->
				</div>

<div id="row" class="hidden">

  <div id="logged-in">
            <hr />
            <div class="clearfix">
              <p class="h4 pull-left">
                <strong>Hello <span class="username"></span></strong>
              </p>
              <button class="btn btn-danger pull-right" id="logout-btn">Logout</button>
            </div>
            <hr />
            <div id="chat-container">
              <h3>
                Messages
              </h3>
              <div id="chat-messages"></div>
              <hr />
              <div id="chat-input">
                <div class="form-group">
                  <label for="chat-contacts">Select Contact</label>
                  <select name="chat-contacts" id="chat-contacts" class="form-control"></select>
                  
                </div>
                <div class="form-group">
                  <label for="chat-file">Chat File</label>
                  <input type="file" name="chat-file" id="chat-file" class="form-control" />
                  
                </div>
                <button name="button" type="submit" class="btn btn-success" id="file-btn">Send</button>
                
              </div>
            </div>
          </div>
</div>

<!-- File upload new design -->
<div id="row">

<div class="panel panel-default">
			
				<div class="panel-heading">
					<h3 class="panel-title">
						Upload Files <small>Send file to Bank agent</small>
					</h3>
				</div>
				
				<div class="panel-body">
					
					
					
					<br />
					<div class="row">
						<div class="col-sm-3 text-center">
						
							<div id="advancedDropzone" class="droppable-area">
								Drop Files Here
							</div>
							
						</div>
						<div class="col-sm-9">
							
							<table class="table table-bordered table-striped" id="example-dropzone-filetable">
								<thead>
									<tr>
										<th width="1%" class="text-center">#</th>
										<th width="50%">Name</th>
										<th width="20%">Upload Progress</th>
										<th>Size</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5">Files list will appear here</td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</div>
					
				</div>
			
			</div>
</div>


<!--File upload end  -->

			</section>
			<section class="profile-env" id="profile_section">

				<div class="row">

					<!-- <div class="col-sm-3">
						
						User Info Sidebar
						<div class="user-info-sidebar">
							
							<a href="#" class="user-img">
								<img src="../assets/images/user-4.png" alt="user-img" class="img-cirlce img-responsive img-thumbnail" />
							</a>
							
							<a href="#" class="user-name">
								Art Ramadani
								<span class="user-status is-online"></span>
							</a>
							
							<span class="user-title">
								CEO at <strong>Google</strong>
							</span>
							
							<hr />
							
							<ul class="list-unstyled user-info-list">
							<li>
								<i class="fa-home"></i>
								Prishtina, Kosovo
							</li>
							<li>
								<i class="fa-briefcase"></i>
								<a href="#">Laborator</a>
							</li>
							<li>
								<i class="fa-graduation-cap"></i>
								University of Bologna
							</li>
						</ul>	
								
							<hr />
							
							<ul class="list-unstyled user-friends-count">
								<li>
									<span>643</span>
									followers
								</li>
								<li>
									<span>108</span>
									following
								</li>
							</ul>
							
							<button type="button" class="btn btn-success btn-block text-left">
								
								<i class="fa-headphones "></i> Customer Care
							</button>
						</div>
						
					</div> -->
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

					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">Recent Transactions</h3>

								<div class="panel-options">
									<a href="#"> <i class="linecons-cog"></i>
									</a> <a href="#" data-toggle="panel"> <span
										class="collapse-icon">&ndash;</span> <span class="expand-icon">+</span>
									</a> <a href="#" data-toggle="reload"> <i
										class="fa-rotate-right"></i>
									</a>


								</div>
							</div>

							<table class="table table-striped">
								<thead>
									<tr>
										<th>#</th>
										<th>Date</th>
										<th>Description</th>
										<th>Type</th>
										<th>Amount</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>1</td>
										<td>30/Jun/2015</td>
										<td>ATM Withdrawn at TechMCC Chennai</td>
										<td>Debited</td>
										<td class="middle-align">5000.00</td>
									</tr>
									<tr>
										<td>2</td>
										<td>27/Jun/2015</td>
										<td>Cheque No:985054</td>
										<td>Debited</td>
										<td class="middle-align">9500.00</td>
									</tr>
									<tr>
										<td>3</td>
										<td>16/Jun/2015</td>
										<td>IMPS Tranfered Inwards</td>
										<td>Credited</td>
										<td class="middle-align">78600.00</td>
									</tr>

									<tr>
										<td>5</td>
										<td>31/May/2015</td>
										<td>Salary Credited Tech Mahindra</td>
										<td>Credited</td>
										<td class="middle-align">49660.00</td>
									</tr>

									<tr>
										<td>4</td>
										<td>28/May/2015</td>
										<td>ATM Card Maintenace Charges</td>
										<td>Debited</td>
										<td class="middle-align">250.00</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>

				</div>

			</section>

			<script type="text/javascript"
				src="//maps.google.com/maps/api/js?sensor=false"></script>
			<script type="text/javascript">
				function initialize() {
					var $ = jQuery, map_canvas = $("#sample-checkin");

					var location = new google.maps.LatLng(36.738888,
							-119.783013), map = new google.maps.Map(
							map_canvas[0], {
								center : location,
								zoom : 14,
								mapTypeId : google.maps.MapTypeId.ROADMAP,
								scrollwheel : false
							});

					var marker = new google.maps.Marker({
						position : location,
						map : map
					});
				}

				google.maps.event.addDomListener(window, 'load', initialize);
			</script>

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

	<!-- Imported styles on this page -->
	<link rel="stylesheet"
		href="../assets/css/fonts/elusive/css/elusive.css">

	<!-- Bottom Scripts -->
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/TweenMax.min.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/joinable.js"></script>
	<script src="../assets/js/xenon-api.js"></script>
	<script src="../assets/js/xenon-toggles.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/xenon-custom.js"></script>
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="../assets/js/dropzone/css/dropzone.css">

	<!-- Bottom Scripts -->
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/TweenMax.min.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/joinable.js"></script>
	<script src="../assets/js/xenon-api.js"></script>
	<script src="../assets/js/xenon-toggles.js"></script>


	<!-- Imported scripts on this page -->
	<script src="../assets/js/dropzone/dropzone.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/xenon-custom.js"></script>
	

</body>
</html>