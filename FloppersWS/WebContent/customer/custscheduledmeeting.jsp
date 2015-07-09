<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<tags:custdependencies></tags:custdependencies>
<tags:script src="customer/custscheduledmeeting.js" />
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
        sendMessage(currentText);
        alert(currentText);
       	console.log(currentText);
       /*  xmlHttp.open("post", "../VoiceCustomerServlet", true); 
        alert("get executed");
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xmlHttp.send( "final_span=" + currentText +"&username="+ "basha");
        alert("get sent"); */
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
    
   
    kandy.messaging.sendIm(sendTo, message, function () {

   var $username="Customer";    
   var $message = message.substring(12);
//   $("#xe-body ul").append('<li><div class="xe-comment-entry"><a class="xe-user-img" href="#"><img width="40" class="img-circle" src="../assets/images/user-2.png"></a><div class="xe-comment"><strong>'+$username+'</strong></a><p>'+$message+'</p></div></div></li>');
   //$("#xe-body-voice2text ul").append('<li><div class="xe-comment-entry"><div class="xe-comment"><strong>'+$username+'</strong></a><p>'+$message+'</p></div></div></li>');
   
   $("#xe-body-voice2text ul").append('<li>'+$username+':<p>'+$message+'</p></li>');

    },
    function () {
        alert('IM send failed');
      }
    );
  }
</script>
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
								<h1 class="title">Scheduled Meeting</h1>
							</div>
							<script type="text/javascript">
							 show =false;
							
							
							</script>

						</s:else>
					</div>
				</div>


			</section>
			<section id="eventID_section">
				<s:form action="custscheduledmeeting">
					<div class="col-sm-12">
						<tags:rowOdd>
							<td><label>Event ID</label></td>
							<td><input type="text" name="eventID" id="eventID"></td>
							<td><div id="eventID_error" class="level4_error">
									<s:fielderror fieldName="eventID" cssClass="level4_error">
									</s:fielderror>
								</div></td>
						</tags:rowOdd>
						<tags:rowEven>
							<tags:submitreset />
							<td></td>
						</tags:rowEven>
					</div>
				</s:form>

			</section>

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
										Chat Messages <small>Chatting arround</small>
									</h3>
								</div>
							</div>
							<div class="xe-body  widget-scroll" id="xe-body">
								<!-- chat to be added dynamically -->
								<ul class="list-unstyled" id="chatItem">

								</ul>
							</div>
						</div>

						<div class="hidden" id="logged-in">
							<div id="chat-container">
								<div id="chat-input">
									<div class="form-group">
										<label for="chat-message">Chat Message</label> <input
											type="text" name="chat-message" id="chat-message"
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
									<!-- chat to be added dynamically -->
									<div class="row">
										<div class="col-sm-10">
											<div class="video" id="incoming-video"></div>
										</div>
										<!-- <div class="col-sm-6">
				                  <div class="video" id="outgoing-video"></div>
				                </div> -->
									</div>
								</div>
							</div>
							<hr />
							<div class="hidden" id="incoming-call">
								<h4>Incoming Call</h4>
								<p id="username-incoming"></p>
								<div class="btn-toolbar">
									<button class="btn btn-success col-sm-5" id="answer-call-btn">Answer
										Call</button>
									<button class="btn btn-warning col-sm-5" id="reject-call-btn">Reject
										Call</button>
								</div>
							</div>
							<div class="hidden" id="call-connected">
								<h4>Call Connected</h4>
								<p id="username-connected"></p>
								<div class="btn-toolbar">
									<button class="btn btn-danger col-sm-5" id="end-call-btn">End
										Call</button>
									<button class="btn btn-warning col-sm-5" id="hold-call-btn">Hold
										Call</button>
									<button class="btn btn-success hidden col-sm-5"
										id="resume-call-btn">Resume Call</button>
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
							<h3>Messages</h3>
							<div id="chat-messages"></div>
							<hr />
							<div id="chat-input">
								<div class="form-group">
									<label for="chat-contacts">Select Contact</label> <select
										name="chat-contacts" id="chat-contacts" class="form-control"></select>

								</div>
								<div class="form-group">
									<label for="chat-file">Chat File</label> <input type="file"
										name="chat-file" id="chat-file" class="form-control" />

								</div>
								<button name="button" type="submit" class="btn btn-success"
									id="file-btn">Send</button>

							</div>
						</div>
					</div>
				</div>

				<!-- VOICE TO TEXT -->
				<div class="row">
					<div class="panel panel-default" id="main">
						<div class="compact marquee-stacked hidden" id="marquee">
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
								<button id="start_button" onclick="startButton(event)"
									class="btn btn-purple btn-icon" text="Speak">

									<span>Translate</span> <i class="fa-bullhorn"></i>

									<!-- <img alt="Start" id="start_img"
										src="/intl/en/chrome/assets/common/images/content/mic.gif"> -->
								</button>
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
							<div class="select2-drop-mask" id="div_language"
								style="display: block;">
								<select id="select_language" onchange="updateCountry()">
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

									<div id="advancedDropzone" class="droppable-area">Drop
										Files Here</div>

								</div>
								<div class="col-sm-9">

									<table class="table table-bordered table-striped"
										id="example-dropzone-filetable">
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