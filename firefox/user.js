// CACHING [-

// PREF: Disable disk cache
// http://kb.mozillazine.org/Browser.cache.disk.enable
user_pref("browser.cache.disk.enable", false);

// PREF: Disable memory cache (disabled)
// http://kb.mozillazine.org/Browser.cache.memory.enable
user_pref("browser.cache.memory.enable", true);

// PREF: Define how much RAM to use for caching (in KB)
// http://kb.mozillazine.org/Browser.cache.memory.capacity
// value -1 -- decide automatically based on total RAM
user_pref("browser.cache.memory.capacity", -1);

// PREF: Disable Caching of SSL Pages
// CIS Version 1.2.0 October 21st, 2011 2.5.8
// http://kb.mozillazine.org/Browser.cache.disk_cache_ssl
user_pref("browser.cache.disk_cache_ssl", false);

// PREF: Do not download URLs for the offline cache
// http://kb.mozillazine.org/Browser.cache.offline.enable
user_pref("browser.cache.offline.enable", false);

// PREF: Restrict max number of pages stored in memory (back and forward)
// http://kb.mozillazine.org/Browser.sessionhistory.max_total_viewers
user_pref("browser.sessionhistory.max_entries", 10);
// -]
// FONTS [-

// PREF: Prevent websites from using their fonts
uer_pref("browser.display.use_document_fonts", 0);

// PREF: default language group
user_pref("font.language.group", x-western);

// PREF: default font type in x-western group
user_pref("font.default.x-western", sans-serif);

// PREF: monospace fonts
user_pref("font.name.monospace.ja", Noto Sans Mono CJK JP);
user_pref("font.name.monospace.x-western", Noto Mono);

// PREF: sans-serif fonts
user_pref("font.name.sans-serif.ja", Noto Sans CJK JP);
user_pref("font.name.sans-serif.x-western", Noto Sans);

// PREF: serif fonts
user_pref("font.name.serif.ja", IPAexMincho);
user_pref("font.name.serif.x-western", Noto Serif);

// PREF: font sizes
user_pref("font.size.fixed.ja", 14);
user_pref("font.size.fixed.x-western", 14);
user_pref("font.size.variable.ja", 18);
user_pref("font.size.variable.x-western", 18);
user_pref("");
// -]
// PERFORMANCE [-

// PREF: do not put placeholders for unavailable images
// http://www.download3k.com/articles/How-To-Optimize-Firefox-By-Tweaking-Hidden-Settings-In-The-about-config-Page-01955#Browser.display.show_image_placeholders
user_pref("browser.display.show_image_placeholders", false);

// PREF: reduce page reflows to decrease loading times
// http://kb.mozillazine.org/Content.notify.interval
// http://kb.mozillazine.org/Content.notify.ontimer
// http://kb.mozillazine.org/Content.switch.threshold
user_pref("content.notify.ontimer", true);
user_pref("content.notify.interval", 500000);
user_pref("content.switch.threshold", 250000);

// PREF: reducing loading time and reduces network load
// http://kb.mozillazine.org/Network.http.pipelining
user_pref("network.http.pipelining", true);
user_pref("network.http.pipelining.aggressive", true);
user_pref("network.http.pipelining.ssl", true);
user_pref("network.http.pipelining.maxrequests", 32);
user_pref("network.http.proxy.keep-alive", true);
user_pref("network.http.proxy.pipelining", true);

// PREF: amount of ms to wait before displaying a webpage
// http://kb.mozillazine.org/Nglayout.initialpaint.delay
user_pref("nglayout.initialpaint.delay", 0);

// PREF: enabling e10s
// user_pref("browser.tabs.remove.autostart", true);
// user_pref"extensions.e10sBlockedByAddons", false);
// user_pref("extensions.e10sBlocksEnabling", false);
// user_pref("browser.tabs.remote.force-enable", true);
// -]
// PREFERENCES [-

// PREF: Don't try to guess domain names when entering an invalid domain name in URL bar
// http://www-archive.mozilla.org/docs/end-user/domain-guessing.html
user_pref("browser.fixup.alternate.enabled", false);

// PREF: open popup js windows in new tab
user_pref("browser.link.open_newwindow.restriction", 0);

// PREF: restrict the new tab page
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.enhanced", false);

// PREF: show warning on quit
user_pref("browser.showQuitWarning" true);

// PREF: disable closing ff on closing last tab
user_pref("browser.tabs.closeWindowWithLastTab", false);

// PREF: draw tabs in title bar (currently not supported in linux)
// https://bugzilla.mozilla.org/show_bug.cgi?id=513159
user_pref("browser.tabs.drawInTitlebar", true);

// PREF: Don't trim HTTP off of URLs in the address bar.
// https://bugzilla.mozilla.org/show_bug.cgi?id=665580
user_pref("browser.urlbar.trimURLs", false);

// PREF: Disable Pocket
// https://support.mozilla.org/en-US/kb/save-web-pages-later-pocket-firefox
// https://github.com/pyllyukko/user.js/issues/143
user_pref("browser.pocket.enabled",				false);
user_pref("extensions.pocket.enabled", false);

// PREF: disable reader
user_pref("reader.parse-on-load.enabled", false);

// PREF: Disable face detection
user_pref("camera.control.face_detection.enabled",       false);

// PREF: dev-tools dark theme
user_pref("devtools.theme", dark);

// PREF: prevent webpages from resizing ff window
// https://bugzilla.mozilla.org/show_bug.cgi?id=454779
user_pref("dom.disable_window_move_resize", true);

// PREF: restrict number of popups to appear from single click
user_pref("dom.popup_maximum", 3);

// PREF: Do not submit invalid URIs entered in the address bar to the default search engine
// http://kb.mozillazine.org/Keyword.enabled
// user_pref("keyword.enabled", false);

/OutputClass/ PREF: disabling autoplay on videos
// https://www.ghacks.net/2015/06/11/finally-mozilla-adds-working-html5-video-autoplay-blocking-to-firefox/
user_pref("media.autoplay.enabled", false);
// -]
// SECURITY [-

// PREF: Disable "beacon" asynchronous HTTP transfers (used for analytics)
// https://developer.mozilla.org/en-US/docs/Web/API/navigator.sendBeacon
user_pref("beacon.enabled", false);

// PREF: Disable pinging URIs specified in HTML <a> ping= attributes
// http://kb.mozillazine.org/Browser.send_pings
user_pref("browser.send_pings",					false);

// PREF: Enable blocking reported web forgeries
// https://wiki.mozilla.org/Security/Safe_Browsing
// http://kb.mozillazine.org/Safe_browsing
// https://support.mozilla.org/en-US/kb/how-does-phishing-and-malware-protection-work
// http://forums.mozillazine.org/viewtopic.php?f=39&t=2711237&p=12896849#p12896849
// CIS 2.3.4
user_pref("browser.safebrowsing.phishing.enabled",		true); // firefox >= 50

// PREF: Enable blocking reported attack sites
// http://kb.mozillazine.org/Browser.safebrowsing.malware.enabled
// CIS 2.3.5
user_pref("browser.safebrowsing.malware.enabled",		true);

// PREF: Disable querying Google Application Reputation database for downloaded binary files
// https://www.mozilla.org/en-US/firefox/39.0/releasenotes/
// https://wiki.mozilla.org/Security/Application_Reputation
user_pref("browser.safebrowsing.downloads.remote.enabled",	false);

// PREF: Disable Heartbeat  (Mozilla user rating telemetry)
// https://wiki.mozilla.org/Advocacy/heartbeat
// https://trac.torproject.org/projects/tor/ticket/19047
user_pref("browser.selfsupport.url",				"");

// PREF: Disable collection/sending of the health report (healthreport.sqlite*)
// https://support.mozilla.org/en-US/kb/firefox-health-report-understand-your-browser-perf
// https://gecko.readthedocs.org/en/latest/toolkit/components/telemetry/telemetry/preferences.html
user_pref("datareporting.healthreport.uploadEnabled",		false);
user_pref("datareporting.healthreport.service.enabled",		false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// PREF: Disable the built-in PDF viewer
// https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-2743
// https://blog.mozilla.org/security/2015/08/06/firefox-exploit-found-in-the-wild/
// https://www.mozilla.org/en-US/security/advisories/mfsa2015-69/
user_pref("pdfjs.disabled", true);

// PREF: Enable hardening against various fingerprinting vectors (Tor Uplift project)
// https://wiki.mozilla.org/Security/Tor_Uplift/Tracking
user_pref("privacy.resistFingerprinting", true);

// PREF: Enable Firefox Tracking Protection
// https://wiki.mozilla.org/Security/Tracking_protection
// https://support.mozilla.org/en-US/kb/tracking-protection-firefox
// https://support.mozilla.org/en-US/kb/tracking-protection-pbm
// https://kontaxis.github.io/trackingprotectionfirefox/
// https://feeding.cloud.geek.nz/posts/how-tracking-protection-works-in-firefox/
user_pref("privacy.trackingprotection.enabled",			true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);

// PREF: When browser pings are enabled, only allow pinging the same host as the origin page
// http://kb.mozillazine.org/Browser.send_pings.require_same_host
user_pref("browser.send_pings.require_same_host", true);

// PREF: Disable sensor API
// https://wiki.mozilla.org/Sensor_API
user_pref("device.sensors.enabled", false);

// PREF: Disable battery API (Firefox < 52)
// https://developer.mozilla.org/en-US/docs/Web/API/BatteryManager
// https://bugzilla.mozilla.org/show_bug.cgi?id=1313580
user_pref("dom.battery.enabled",				false);

// PREF: Disable DOM storage (disabled)
// http://kb.mozillazine.org/Dom.storage.enabled
// https://html.spec.whatwg.org/multipage/webstorage.html
// NOTICE: Disabling DOM storage is known to cause`TypeError: localStorage is null` errors
// user_pref("dom.storage.enabled",		false);

// PREF: Disable telephony API
// https://wiki.mozilla.org/WebAPI/Security/WebTelephony
user_pref("dom.telephony.enabled",				false);

// PREF: Disable gamepad, VR and vibrator APIs
// https://www.w3.org/TR/gamepad/
// https://trac.torproject.org/projects/tor/ticket/13023
// https://developer.mozilla.org/en-US/Firefox/Releases/36#Interfaces.2FAPIs.2FDOM
// https://developer.mozilla.org/en-US/docs/Web/API/WebVR_API
user_pref("dom.gamepad.enabled",				false);
user_pref("dom.vr.enabled",					false);
user_pref("dom.vibrator.enabled", false);

// PREF: Disable Web Audio API
// https://bugzilla.mozilla.org/show_bug.cgi?id=1288359
// user_pref("dom.webaudio.enabled", false);

// PREF: Disable Location-Aware Browsing (geolocation)
// https://www.mozilla.org/en-US/firefox/geolocation/
user_pref("geo.enabled", false);

// PREF: Don't reveal your internal IP when WebRTC is enabled
// https://wiki.mozilla.org/Media/WebRTC/Privacy
// https://github.com/beefproject/beef/wiki/Module%3A-Get-Internal-IP-WebRTC
user_pref("media.peerconnection.ice.no_host", true); // Firefox >= 52

// PREF: Disable DNS prefetching
// http://kb.mozillazine.org/Network.dns.disablePrefetch
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Controlling_DNS_prefetching
user_pref("network.dns.disablePrefetch",			true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);

// PREF: Send a referer header with the target URI as the source
// https://bugzilla.mozilla.org/show_bug.cgi?id=822869
// https://github.com/pyllyukko/user.js/issues/227
// NOTICE: Spoofing referers breaks functionality on websites relying on authentic referer headers
// NOTICE: Spoofing referers breaks visualisation of 3rd-party sites on the Lightbeam addon
// NOTICE: Spoofing referers disables CSRF protection on some login pages not implementing origin-header/cookie+token based CSRF protection
// TODO: https://github.com/pyllyukko/user.js/issues/94, commented-out XOriginPolicy/XOriginTrimmingPolicy = 2 prefs
// user_pref("network.http.referer.spoofSource",			true);

// PREF: Don't send referer headers when following links across different domains (disabled)
// https://github.com/pyllyukko/user.js/issues/227
user_pref("network.http.referer.XOriginPolicy",		1);

// PREF: don't connecto to sites on mouse hover
// https://www.ghacks.net/2015/08/16/block-firefox-from-connecting-to-sites-when-you-hover-over-links/
pref_user("network.http.speculative-parallel-limit", 0);

// PREF: Force Punycode for Internationalized Domain Names
// http://kb.mozillazine.org/Network.IDN_show_punycode
// https://www.xudongz.com/blog/2017/idn-phishing/
// https://wiki.mozilla.org/IDN_Display_Algorithm
// https://en.wikipedia.org/wiki/IDN_homograph_attack
// https://www.mozilla.org/en-US/security/advisories/mfsa2017-02/
// CIS Mozilla Firefox 24 ESR v1.0.0 - 3.6
user_pref("network.IDN_show_punycode", true);

// PREF: Disable prefetching of <link rel="next"> URLs
// http://kb.mozillazine.org/Network.prefetch-next
// https://developer.mozilla.org/en-US/docs/Web/HTTP/Link_prefetching_FAQ#Is_there_a_preference_to_disable_link_prefetching.3F
user_pref("network.prefetch-next",				false);

// PREF: Disable video stats to reduce fingerprinting threat
// https://bugzilla.mozilla.org/show_bug.cgi?id=654550
user_pref("media.video_stats.enabled", false);

// PREF: spoofing OS and CPU
user_pref("general.platform.override", Win64);
user_pref("general.oscpu.override", Windows NT 10.0; Win64; x64);

// PREF: Warn the user when server doesn't support RFC 5746 ("safe" renegotiation)
// https://wiki.mozilla.org/Security:Renegotiation#security.ssl.treat_unsafe_negotiation_as_broken
// https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2009-3555
user_pref("security.ssl.treat_unsafe_negotiation_as_broken",	true);

// PREF: Disallow connection to servers not supporting safe renegotiation (disabled)
// https://wiki.mozilla.org/Security:Renegotiation#security.ssl.require_safe_negotiation
// https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2009-3555
// TODO: `security.ssl.require_safe_negotiation` is more secure but makes browsing next to impossible (2012-2014-... - `ssl_error_unsafe_negotiation` errors), so is left disabled
//user_pref("security.ssl.require_safe_negotiation",		true);

// PREF: Disable RC4
// https://developer.mozilla.org/en-US/Firefox/Releases/38#Security
// https://bugzilla.mozilla.org/show_bug.cgi?id=1138882
// https://rc4.io/
// https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2566
user_pref("security.ssl3.ecdh_ecdsa_rc4_128_sha",		false);
user_pref("security.ssl3.ecdh_rsa_rc4_128_sha",			false);
user_pref("security.ssl3.ecdhe_ecdsa_rc4_128_sha",		false);
user_pref("security.ssl3.ecdhe_rsa_rc4_128_sha",		false);
user_pref("security.ssl3.rsa_rc4_128_md5",			false);
user_pref("security.ssl3.rsa_rc4_128_sha",			false);
user_pref("security.tls.unrestricted_rc4_fallback", false);

// PREF: Disable Mozilla telemetry/experiments
// https://wiki.mozilla.org/Platform/Features/Telemetry
// https://wiki.mozilla.org/Privacy/Reviews/Telemetry
// https://wiki.mozilla.org/Telemetry
// https://www.mozilla.org/en-US/legal/privacy/firefox.html#telemetry
// https://support.mozilla.org/t5/Firefox-crashes/Mozilla-Crash-Reporter/ta-p/1715
// https://wiki.mozilla.org/Security/Reviews/Firefox6/ReviewNotes/telemetry
// https://gecko.readthedocs.io/en/latest/browser/experiments/experiments/manifest.html
// https://wiki.mozilla.org/Telemetry/Experiments
user_pref("toolkit.telemetry.enabled",				false);
user_pref("toolkit.telemetry.unified",				false);
user_pref("experiments.supported",				false);
user_pref("experiments.enabled",				false);
user_pref("experiments.manifest.uri", "");

// PREF: Disable webGL
// https://en.wikipedia.org/wiki/WebGL
// https://www.contextis.com/resources/blog/webgl-new-dimension-browser-exploitation/
// user_pref("webgl.disabled",					true);
// PREF: When webGL is enabled, use the minimum capability mode
// user_pref("webgl.min_capability_mode",				true);
// PREF: When webGL is enabled, disable webGL extensions
// https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API#WebGL_debugging_and_testing
// user_pref("webgl.disable-extensions",				true);
// PREF: When webGL is enabled, force enabling it even when layer acceleration is not supported
// https://trac.torproject.org/projects/tor/ticket/18603
// user_pref("webgl.disable-fail-if-major-performance-caveat",	true);
// PREF: When webGL is enabled, do not expose information about the graphics driver
// https://bugzilla.mozilla.org/show_bug.cgi?id=1171228
// https://developer.mozilla.org/en-US/docs/Web/API/WEBGL_debug_renderer_info
// user_pref("webgl.enable-debug-renderer-info",			false);
// somewhat related...
//user_pref("pdfjs.enableWebGL",					false);
// PREF: enabling hardware accelerations
// user_pref("layers.acceleration.force-enabled", true);
// -]
