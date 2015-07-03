
(function(e, p){
	
    var m = location.href.match(/platform=(win8|win|mac|linux|cros)/);
    e.id = (m && m[1]) ||
           (p.indexOf('Windows NT 6.2') > -1 ? 'win8' : p.indexOf('Windows') > -1 ? 'win' : p.indexOf('Mac') > -1 ? 'mac' : p.indexOf('CrOS') > -1 ? 'cros' : 'linux');
    e.className = e.className.replace(/\bno-js\b/,'js');
  })(document.documentElement, window.navigator.userAgent);
  
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
['??????',            ['hi-IN']],
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
	    xmlHttp.open("POST", "dubakoor", true); 
	    xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	    xmlHttp.send( "final_span=" + currentText );	
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
var n = final_transcript.indexOf('\n');
if (n < 0 || n >= 80) {
 n = 40 + final_transcript.substring(40).indexOf(' ');
}
var subject = encodeURI(final_transcript.substring(0, n));
var body = encodeURI(final_transcript.substring(n + 1));
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

function startButton() {
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
//start_timestamp = event.timeStamp;
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
