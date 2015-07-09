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

<!-- Voice To Text -->
<script>
(function(e, p){
    var m = location.href.match(/platform=(win8|win|mac|linux|cros)/);
    e.id = (m && m[1]) ||
           (p.indexOf('Windows NT 6.2') > -1 ? 'win8' : p.indexOf('Windows') > -1 ? 'win' : p.indexOf('Mac') > -1 ? 'mac' : p.indexOf('CrOS') > -1 ? 'cros' : 'linux');
    e.className = e.className.replace(/\bno-js\b/,'js');
  })(document.documentElement, window.navigator.userAgent)
  
new gweb.analytics.AutoTrack({
          profile: 'UA-26908291-1'
        });
</script>

<link href="https://plus.google.com/100585555255542998765"
	rel="publisher">
<link href="//www.google.com/images/icons/product/chrome-32.png"
	rel="icon" type="image/ico">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin"
	rel="stylesheet">
<link href="/intl/en/chrome/assets/common/css/chrome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
<script src="//www.google.com/js/gweb/analytics/autotrack.js"></script>
<!-- <script src="../sample/voice_text.js"></script> -->
<script src="/intl/en/chrome/assets/common/js/chrome.min.js"></script>


<!-- VTT END -->


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


<tags:script src="common/agentlanding.js" />
</head>
<body class="page-body">

<input type="hidden" id="adminUserName" name="adminUserName"
		value="agent">

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
							<li class="logout-link"><a href="agentlanding!logout"
								title="Log out"> <i class="fa-power-off"></i>
							</a></li>
						</ul>
					</div>
				</section>


				<ul id="main-menu" class="main-menu">
					<!-- add class "multiple-expanded" to allow multiple submenus to open -->
					<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
					<li><a href="dashboard-1.html"> <i class="linecons-cog"></i>
							<span class="title">Call History</span>
					</a>
						<ul>
							<li><a href="dashboard-1.html"> <span class="title">View History
										1</span>
							</a></li>
							<li><a href="dashboard-2.html"> <span class="title">View Converstaion Docs
										2</span>
							</a></li>


						</ul></li>
					

				</ul>

			</div>

		</div>

		<div class="main-content">

			<div class="page-title">

				<div class="title-env">
					<B>Expert Portal</B>
					<div id="current_customer">Current Customer:<span id="current_customer_name">no customer selected</span></div>
					<div id="current_customer">Customer ID:<span id="current_customer_id">select customer from queue</span></div>
					<p class="description">Expert Portal to support the customer</p>
					<button class="btn btn-danger" id="btn_get_customer">Get next customer from queue</button>
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
					<div class="col-sm-4" id="activity-container">
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
											Video <small>Video call with bank executive</small>
										</h3>
									</div>
								</div>
								<div class="xe-body video-scroll" id="xe-body">
									<div class="row">
										<div class="col-sm-6">
											<div class="video" id="incoming-video"></div>
										</div>
										<div class="col-sm-6">
											<div class="video" id="outgoing-video"></div>
										</div>
									</div>
								</div>
								
								<div id="call-form">
									<h4>Make a Call</h4>
									<p id="username-calling"></p>
									<div class="form-group call-initializer">
										<label for="user_to_call">Enter Caller Username</label> <input
											type="text" name="user_to_call" id="user_to_call"
											class="form-control" placeholder="name@company.com"
											value="customer@webrtc.techmahindra.com" />

									</div>
									<div class="form-group call-initializer">
										<button class="btn btn-success" id="initialize-call-btn">Call</button>
									</div>

									<div class="form-group call-terminator hidden">
										<button class="btn btn-danger" id="initialize-end-btn">End
											Call</button>
									</div>
								

								</div>
								<div class="hidden" id="call-connected">
									<h4>Call Connected</h4>
									<p id="username-connected"></p>
									<div class="btn-toolbar">
										<button class="btn btn-danger" id="end-call-btn">End
											Call</button>
										<button class="btn btn-warning" id="hold-call-btn">Hold
											Call</button>
										<button class="btn btn-success hidden" id="resume-call-btn">Resume
											Call</button>
									</div>
									<hr>
								</div>
							</div>
										
							
						</div>
						<!-- <div id="start_call">
						<button class="btn btn-success col-sm-5" id="start_videocall_btn">Start Video Call</button>
						</div> -->




					</div>

					<!-- video call end -->

					<!-- User Queue -->
					<div class="col-sm-2 panel panel-default">
						
							<div class="panel-heading">
								<h3 class="panel-title">User Queue</h3>
							</div>
							<!-- <div class="panel-options">
								<a href="#" data-toggle="panel"> <span class="collapse-icon">-</span>
									<span class="expand-icon">+</span>
								</a> <a href="#" data-toggle="remove"> × </a>
							</div> -->
							<div class="panel-body" id="user_queue_container">
							<ul id="user_queue">
							
								
							</ul>
										
							</div>

						
					</div>
				</div>
       <!-- file sharing -->
       
       <div id="row" class = "hidden">

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
       
       <!-- file sharing end -->
       <!-- VOICE TO TEXT -->
				<div class="row">
					<div class="panel panel-default" id="main">
						<div class="compact marquee-stacked hidden" id="marquee" >
							<div class="marquee-copy">
								<h1>
									<a class="c1"
										href="http://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html">Web
										Speech API</a> Demonstration
								</h1>
							</div>
						</div>
						<div class="compact marquee">
							<div id="info" class="hidden">
								<p id="info_start">Click on the microphone icon and begin
									speaking for as long as you like.</p>
								<p id="info_speak_now" style="display: none">Speak now.</p>
								<p id="info_no_speech" style="display: none">
									No speech was detected. You may need to adjust your <a
										href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">microphone
										settings</a>.
								</p>
								<p id="info_no_microphone" style="display: none">
									No microphone was found. Ensure that a microphone is installed
									and that <a
										href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
										microphone settings</a> are configured correctly.
								</p>
								<p id="info_allow" style="display: none">Click the "Allow"
									button above to enable your microphone.</p>
								<p id="info_denied" style="display: none">Permission to use
									microphone was denied.</p>
								<p id="info_blocked" style="display: none">Permission to use
									microphone is blocked. To change, go to
									chrome://settings/contentExceptions#media-stream</p>
								<p id="info_upgrade" style="display: none">
									Web Speech API is not supported by this browser. Upgrade to <a
										href="//www.google.com/chrome">Chrome</a> version 25 or later.
								</p>
							</div>
							<div id="div_start">
								<button id="start_button" onclick="startButton(event)" class="btn btn-purple btn-icon" text="Speak">
								
									<span>Translate</span>
									<i class="fa-bullhorn"></i>
								
									<!-- <img alt="Start" id="start_img"
										src="/intl/en/chrome/assets/common/images/content/mic.gif"> -->
								</button>
								<div>
								<label><strong>User Selected Language is:</strong><h3><div id="user_language"></div></h3><div id="#user_language_code" class="hidden"></div></label>
								
								</div>
									<!-- <input type="checkbox" id="chkTranslate" name="chkTranslate" value="chkTranslate" class="iswitch iswitch-secondary"> Translate to English when other languge message comes in.<br> -->
							</div>
							
							<div id="copy" class="hidden">
								<button class="button" id="copy_button" onclick="copyButton()">Copy
									and Paste</button>
								<div id="copy_info">
									<p>Press Control-C to copy text.</p>
									<p>(Command-C on Mac.)</p>
								</div>
								<button class="button" id="email_button" onclick="emailButton()">Create
									Email</button>
								<div id="email_info">
									<p>Text sent to default email application.</p>
									<p>(See chrome://settings/handlers to change.)</p>
								</div>
							</div>
							<div class="select2-drop-mask" id="div_language" style="display: block;">
								<select id="select_language" onchange="updateCountry()" >
								</select>&nbsp;&nbsp; <select id="select_dialect">
								</select>
							</div>
							<div id="results">
								<span class="final" id="final_span"></span> <span
									class="interim" id="interim_span"></span>
							</div>
						</div>
					</div>
				</div>
			<!-- END -->
       
       
       
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


<!-- Voice To Text Conversation merge -->

			<div id="row">
				<div class="col-sm-6" id="voice2text">
					<div class="xe-widget xe-conversations">
							
							<div class="xe-header">
								
								<div class="xe-label">
									<h3>
										Conversations <small>Voice to text</small>
									</h3>
								</div>
							</div>
							<div class="xe-body  widget-scroll" id="xe-body-voice2text">
								<!-- chat to be added dynamically -->
								<ul class="list-unstyled" id="chatItem">
									
								</ul>
							</div>
						</div>								
				</div>			
			</div>

				
				<!-- Voice to text conversation merge end -->

			</section>
			


			<!-- Main Footer -->
			<!-- Choose between footer styles: "footer-type-1" or "footer-type-2" -->
			<!-- Add class "sticky" to  always stick the footer to the end of page (if page contents is small) -->
			<!-- Or class "fixed" to  always fix the footer to the end of page -->
			<footer class="main-footer sticky footer-type-1">

				<div class="footer-inner">

					<!-- Add your copyright text here -->
					<div class="footer-text">
						&copy; 2015 <strong>Floppers Developers</strong>
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

	
	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/xenon-custom.js"></script>
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="../assets/js/dropzone/css/dropzone.css">

	<!-- Bottom Scripts -->
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/tweenmax.min.js"></script>
	<script src="../assets/js/resizeable.js"></script>
	<script src="../assets/js/joinable.js"></script>
	<script src="../assets/js/xenon-api.js"></script>
	<script src="../assets/js/xenon-toggles.js"></script>


	<!-- Imported scripts on this page -->
	<script src="../assets/js/dropzone/dropzone.min.js"></script>


	<!-- JavaScripts initializations and stuff -->
	<script src="../assets/js/xenon-custom.js"></script>
	
	<!-- Voice to TEXT js -->
	<script src="/intl/en/chrome/assets/common/js/chrome.min.js">
</script>
	<script>
var chrmMenuBar = new chrm.ui.MenuBar();
      chrmMenuBar.decorate('nav');
      var chrmLogo = new chrm.ui.Logo('logo');

      var chrmscroll = new chrm.ui.SmoothScroll('scroll');
      chrmscroll.init();



  window.___gcfg = { lang: 'en' };
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();




      var doubleTracker = new gweb.analytics.DoubleTrack('floodlight', {
          src: 2542116,
          type: 'clien612',
          cat: 'chrom0'
      });
      doubleTracker.track();

      doubleTracker.trackClass('doubletrack', true);
    </script>
	<script>
var langs =
[['Afrikaans',       ['af-ZA']],
 ['Bahasa Indonesia',['id-ID']],
 ['Bahasa Melayu',   ['ms-MY']],
 ['Catal',          ['ca-ES']],
 ['?etina',         ['cs-CZ']],
 ['Dansk',           ['da-DK']],
 ['Deutsch',         ['de-DE']],
 ['English',         ['en-AU', 'Australia'],
                     ['en-CA', 'Canada'],
                     ['en-IN', 'India'],
                     ['en-NZ', 'New Zealand'],
                     ['en-ZA', 'South Africa'],
                     ['en-GB', 'United Kingdom'],
                     ['en-US', 'United States']],
 ['Espaol',         ['es-AR', 'Argentina'],
                     ['es-BO', 'Bolivia'],
                     ['es-CL', 'Chile'],
                     ['es-CO', 'Colombia'],
                     ['es-CR', 'Costa Rica'],
                     ['es-EC', 'Ecuador'],
                     ['es-SV', 'El Salvador'],
                     ['es-ES', 'Espaa'],
                     ['es-US', 'Estados Unidos'],
                     ['es-GT', 'Guatemala'],
                     ['es-HN', 'Honduras'],
                     ['es-MX', 'Mxico'],
                     ['es-NI', 'Nicaragua'],
                     ['es-PA', 'Panam'],
                     ['es-PY', 'Paraguay'],
                     ['es-PE', 'Per'],
                     ['es-PR', 'Puerto Rico'],
                     ['es-DO', 'Repblica Dominicana'],
                     ['es-UY', 'Uruguay'],
                     ['es-VE', 'Venezuela']],
 ['Euskara',         ['eu-ES']],
 ['Filipino',        ['fil-PH']],
 ['Franais',        ['fr-FR']],
 ['Galego',          ['gl-ES']],
 ['Hrvatski',        ['hr_HR']],
 ['IsiZulu',         ['zu-ZA']],
 ['slenska',        ['is-IS']],
 ['Italiano',        ['it-IT', 'Italia'],
                     ['it-CH', 'Svizzera']],
 ['Lietuvi?',        ['lt-LT']],
 ['Magyar',          ['hu-HU']],
 ['Nederlands',      ['nl-NL']],
 ['Norsk bokml',    ['nb-NO']],
 ['Polski',          ['pl-PL']],
 ['Portugus',       ['pt-BR', 'Brasil'],
                     ['pt-PT', 'Portugal']],
 ['Romn?',          ['ro-RO']],
 ['Sloven?ina',     ['sl-SI']],
 ['Sloven?ina',      ['sk-SK']],
 ['Suomi',           ['fi-FI']],
 ['Svenska',         ['sv-SE']],
 ['Ti?ng Vi?t',      ['vi-VN']],
 ['Trke',          ['tr-TR']],
 ['????????',        ['el-GR']],
 ['?????????',       ['bg-BG']],
 ['P??????',         ['ru-RU']],
 ['??????',          ['sr-RS']],
 ['??????????',      ['uk-UA']],
 ['???',            ['ko-KR']],
 ['??',             ['cmn-Hans-CN', '??? (????)'],
                     ['cmn-Hans-HK', '??? (??)'],
                     ['cmn-Hant-TW', '?? (??)'],
                     ['yue-Hant-HK', '?? (??)']],
 ['???',           ['ja-JP']],
 ['Hindi',            ['hi-IN']],
 ['???????',         ['th-TH']]];

for (var i = 0; i < langs.length; i++) {
  select_language.options[i] = new Option(langs[i][0], i);
}
select_language.selectedIndex = 7;
updateCountry();
select_dialect.selectedIndex = 6;
showInfo('info_start');

function updateCountry() {
  for (var i = select_dialect.options.length - 1; i >= 0; i--) {
    select_dialect.remove(i);
  }
  var list = langs[select_language.selectedIndex];
  for (var i = 1; i < list.length; i++) {
    select_dialect.options.add(new Option(list[i][1], list[i][0]));
  }
  select_dialect.style.visibility = list[1].length == 1 ? 'hidden' : 'visible';
}

var create_email = false;
var final_transcript = '';
var recognizing = false;
var ignore_onend;
var start_timestamp;
if (!('webkitSpeechRecognition' in window)) {
  upgrade();
} else {
  start_button.style.display = 'inline-block';
  var recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.interimResults = true;

  recognition.onstart = function() {
    recognizing = true;
    showInfo('info_speak_now');
    start_img.src = '/intl/en/chrome/assets/common/images/content/mic-animate.gif';
  };

  recognition.onerror = function(event) {
    if (event.error == 'no-speech') {
      start_img.src = '/intl/en/chrome/assets/common/images/content/mic.gif';
      showInfo('info_no_speech');
      ignore_onend = true;
    }
    if (event.error == 'audio-capture') {
      start_img.src = '/intl/en/chrome/assets/common/images/content/mic.gif';
      showInfo('info_no_microphone');
      ignore_onend = true;
    }
    if (event.error == 'not-allowed') {
      if (event.timeStamp - start_timestamp < 100) {
        showInfo('info_blocked');
      } else {
        showInfo('info_denied');
      }
      ignore_onend = true;
    }
  };

  recognition.onend = function() {
    recognizing = false;
    if (ignore_onend) {
      return;
    }
    start_img.src = '/intl/en/chrome/assets/common/images/content/mic.gif';
    if (!final_transcript) {
      showInfo('info_start');
      return;
    }
    showInfo('');
    if (window.getSelection) {
      window.getSelection().removeAllRanges();
      var range = document.createRange();
      range.selectNode(document.getElementById('final_span'));
      window.getSelection().addRange(range);
    }
    if (create_email) {
      create_email = false;
      createEmail();
    }
  };

  recognition.onresult = function(event) {
	    var interim_transcript = '';
	    if (typeof(event.results) == 'undefined') {
	      recognition.onend = null;
	      recognition.stop();
	      upgrade();
	      return;
	    }
	    var xmlHttp = new XMLHttpRequest();
	    var currentText;
	    for (var i = event.resultIndex; i < event.results.length; ++i) {
	      if (event.results[i].isFinal) {
	        final_transcript += event.results[i][0].transcript;
	        currentText = event.results[i][0].transcript;	
	        // Start transaltion here
	        var lang=$('#user_language_code').text();
	        console.log("Translang:"+lang);
	       $.ajax({
	        	        type: "post",
	        	        url: "../TransServlet", //this is my servlet
	        	        dataType : 'text',


	        	        data:"message="+currentText+"&language="+lang,
	        	     
	        	        success: function(response){
	        	        	console.log(response);
	        	        	 sendMessage(response);

	        	        }, error: function(e){
	        	        	   alert('Error: ' + e);
	        	        }
	        	  });

	        alert(currentText);
	       	console.log(currentText);
	       
	      } else {
	        interim_transcript += event.results[i][0].transcript;
	      }
	    }
	    final_transcript = capitalize(final_transcript);
	    final_span.innerHTML = linebreak(final_transcript);
	    interim_span.innerHTML = linebreak(interim_transcript);
	    if (final_transcript || interim_transcript) {
	      showButtons('inline-block');
	    }
	  };
}

function upgrade() {
  start_button.style.visibility = 'hidden';
  showInfo('info_upgrade');
}

var two_line = /\n\n/g;
var one_line = /\n/g;
function linebreak(s) {
  return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
}

var first_char = /\S/;
function capitalize(s) {
  return s.replace(first_char, function(m) { return m.toUpperCase(); });
}

function createEmail() {
  var test = final_transcript.indexOf('\n');
  if (test < 0 || test >= 80) {
    n = 40 + final_transcript.substring(40).indexOf(' ');
  }
  var subject = encodeURI(final_transcript.substring(0, test));
  var body = encodeURI(final_transcript.substring(test + 1));
  window.location.href = 'mailto:?subject=' + subject + '&body=' + body;
}

function copyButton() {
  if (recognizing) {
    recognizing = false;
    recognition.stop();
  }
  copy_button.style.display = 'none';
  copy_info.style.display = 'inline-block';
  showInfo('');
}

function emailButton() {
  if (recognizing) {
    create_email = true;
    recognizing = false;
    recognition.stop();
  } else {
    createEmail();
  }
  email_button.style.display = 'none';
  email_info.style.display = 'inline-block';
  showInfo('');
}

function startButton(event) {
  if (recognizing) {
    recognition.stop();
    return;
  }
  final_transcript = '';
  recognition.lang = select_dialect.value;
  recognition.start();
  ignore_onend = false;
  final_span.innerHTML = '';
  interim_span.innerHTML = '';
  start_img.src = '/intl/en/chrome/assets/common/images/content/mic-slash.gif';
  showInfo('info_allow');
  showButtons('none');
  start_timestamp = event.timeStamp;
}

function showInfo(s) {
  if (s) {
    for (var child = info.firstChild; child; child = child.nextSibling) {
      if (child.style) {
        child.style.display = child.id == s ? 'inline' : 'none';
      }
    }
    info.style.visibility = 'visible';
  } else {
    info.style.visibility = 'hidden';
  }
}

var current_style;
function showButtons(style) {
  if (style == current_style) {
    return;
  }
  current_style = style;
  copy_button.style.display = style;
  email_button.style.display = style;
  copy_info.style.display = 'none';
  email_info.style.display = 'none';
}

function copyToString() {
	  
	}
	
function sendMessage(e) {
	var message="VOICEMESSAGE";
    message = message+e;
    
    
    
    sendTo =  $('#user_to_call').val();
    alert(sendTo);
   console.log(sendTo);
    kandy.messaging.sendIm(sendTo, message, function () {

   var $username="You";    
   var $message = message.substring(12);
   $("#xe-body-voice2text ul").append('<li>'+$username+':<p>'+$message+'</p></li>');

    },
    function () {
        alert('IM send failed');
      }
    );
  }
    </script>
	<!-- Voice to TEXT js END -->
	

</body>
</html>