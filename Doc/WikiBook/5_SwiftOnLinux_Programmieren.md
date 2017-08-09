====Navigation====
__TOC__
==Server installieren==

Der Server wird auf Github ausgecheckt und compiliert. Dazu folgenden Link <span class = "plainlinks">[https://github.com/hofchris15/Projektarbeit.git Github/Projekt ]</span> mit Git ausf�hren oder als zip herunterladen. In diesem Repository befinden sich der Ordner NodeServer in dem der Reverenz-Server in JavaScript mit Node und Express.js geschrieben ist. Im Ordner SwiftServer befindet sich der in Swifft geschriebene Server, der f�r diese Installation relevant ist. Damit der Server l�uft ist der Node-Server irrelevant, sodass dieser gel�scht werden kann oder ausgef�hrt werden kann wie im Kapitel "Installation Node Server" beschrieben ist.

===Installation mit Git===
Folgende Befehle sind auszuf�hren:

<blockquote>
	<code>mkdir SwiftServer</code><br/>
	<code>cd SwiftServer</code><br/>
	<code>git clone https://github.com/hofchris15/Projektarbeit.git</code><br/>
	<code>swift build</code> 

	oder 

	<code>swift build --configuration release</code><br/>
</blockquote>

Mit dem ersten Befehl wird in einem beliebigen Verzeichnis der Ordner SwiftServer erstellt, der als Projektordner dient. Danach wechselt man in das Verzeichnis und checkt den Server von Github aus. Danach liegt der Server in Form von Source Code im Verzeichnis "SwiftServer" auf und kann mit dem letzten Befehl compiliert werden. Mit diesem Kommando wird ein debug compilierung durchgef�hrt, das f�r die Entwicklung ben�tigt wird, da mehr Informationen w�hrend der Laufzeit an den Entwickler ausgegeben werden. Um den Server jemanden au�erhalb des Entwicklungsbereichs zu �bergeben wird empfohlen den compiler auf den release-Modus zu stellen. Dazu wird der Befehl <code>swift build --configration release</code> ausgef�hrt. Je nach compiler Konfiguration wird das Produkt im Verzeichnis .build/debug/exe abgelegt oder .build/release/exe abgelegt.
Damit ist die Installation des Servers abgeschlossen und der Server kann gestartet werden. 

===Installation ohne Git===
Der Ablauf ohne Git ist geringf�hgig anders als bei der Installation mit Git. Dazu wird der Server als .zip-Archiv von Github heruntergeladen und in das zuvor erstellt Verzeichnis "SwiftServer" entpackt. 

<blockquote>
	<code>mkdir SwiftServer</code><br/>
	<code>cd SwiftServer</code><br/>
	<code>sudo tar -xcf /path/to/SwiftServer.zip ./</code><br/>
	<code>swift build</code> 

	oder 

	<code>swift build --configuration release</code><br/>
</blockquote>

Danach ist die Installation auch ohne Git abgeschlossen und der Server kann gestartet werden.

==Server starten==
Der Server kann �ber ein Terminal gestartet werden nachdem dieser compiliert wurde siehe auch: [[Installation von Swift#Server installieren]] 
Danach kann der Server mit folgende Kommandos gestartet werden. Einzige Vorraussetzung ist, das man sich bereits mit dem Terminal im Projektordner befindet.

<code> ./.build/debug/exe <code>

oder mit 

<code>./.build/release/exe</code>

Danach sollte folgend Ausgabe auf dem Terminal angezeigt werden:

<blockquote>
	[DBG] init HTTPServer()<br/>
	[DBG] makeRoutes()<br/>
	[INFO] set config<br/>
	[INFO] Starting HTTP server on 0.0.0.0:3000<br/>
</blockquote>

Mit der letzen Zeile wird dar�ber informiert, dass der Server gestartet wurde und auf dem Port 3000 h�rt. Somit kann dieser mit einem bliebigen Browser angesteuert werden. Dazu wird in die Adressleiste <small>localhost:3000</small> eingegeben und es sollte die Login-Seite des Services angezeigt werden. 

Weiter mit einigen Details zum Server und den Packages die Verwendet werden. 

==Details zum Server==

Der Server entstand im zusammenhang mit einer Projektarbeit mit dem Thema Swift on Linux. 
Dazu wurde von uns rechachiert und zwei interessante Frameworks f�r die Entwicklung eines Servers ausgew�hlt. Diese beiden Frameworks sind <span class = "plainlinks">[http://www.kitura.io/ Kitura.io ]</span> und <span class = "plainlinks">[http://perfect.org/ Perfect.org ]</span>.
Grunds�tzlich sind beide Frameworks sehr �hnlich, wobei hierbei einige Punkte einzubringen und beachten sind.
Kitura ist ein Framework das von IBM erstellt wurde und auf MAC sowie auf Linux lauff�hig ist. Perfect wurde von PerfectlySoft Inc. einem kleinem Startup Unternehmen, das sich auf die Entwicklung mit Swift spezialisiert hat. IBM's Kitura hat einen Grunds�tzliche Bibliothek die verwendet wird um einen HTTP Server umzusetzen und einige Packages um die Funktionalit�t zu erweitern. Perfect setzt auf das selbe Prinzip wie Kitura und h�lt wie auch Kitura ein Template als Startpunkt f�r den Server zur Verf�gung. Einziges manko bei Kitura ist auf den ersten Blick, dass die Dokumentation nicht so ausf�hrlich erscheint wie bei Perfect. 
Schlussendlich haben wir uns f�r swift Perfect entschieden. Grund daf�r waren der eben erw�hnte Punkt der Dokumentation, die von Perfect sehr ausf�hrlich ist und auch einige Beispiele f�r verschiedenen Bereiche eines Servers bereith�lt. Die Beispiel und viele Bibliotheken und Packages werden von PerfectlySoft auf deren Github Account gehostet: <span class = "plainlinks">[https://github.com/PerfectlySoft PerfectlySoft on Github ]</span>

===Installation von Perfect===

Auch Perfect setzt einige Packet auf Linux voraus, darunter openssl, libssl-dev und uuid-dev. Diese k�nnen sehr leicht mit 

<code> sudo apt-get install openssl libssl-dev uuid-dev</code> 

installiert werden. 

===Perfect Template ===
Das Perfect Template wurde von uns als Ausgangspunkt der Entwicklung des HTTP Servers im MVC-Pattern gew�hlt. Als Reverence wurde von uns der selbe Server zuvor mit <span class = "plainlinks">[https://nodejs.org/en/  Node.js ]</span> und dem Framework <span class = "plainlinks">[http://expressjs.com/de/  Express.js ]</span> implementiert.
Das Perfect Template h�lt die Standard Baumstruktur des swift init-Prozesses bereit, die bereits in der [[Installation von Swift#Swift Package Manager]] vorgestellt wurde. Weiter befinden sich ein Datei names "main.swift" enth�lt, die die Initalisierung eines Serves bereith�lt. Interressant ist jedoch das in der Package.swift enhaltene Abh�ngigkeit <span class = "plainlinks">[https://github.com/PerfectlySoft/Perfect-HTTPServer.git ]</span>. Der Perfect-HTTPServer hat einige sehr n�tzliche Abh�ngigkeiten die auch wir im Server verwendet haben.

===Die wichtigsten Packages===
Wie oben beschrieben sind einige Packete gruns�tlich notwendig um den Server ins laufen zu bekommen. Diese Grund-Pakete sind PerfectLib COpenSSL, HTTP, HTTPServer, PerfectLib, LinuxBridge und Net.
* Foundation ist die standard Bibliothek von Swift und bietet die gruns�tlichen Funktionen und Definition wie (Strings, Numbers,...) die von der Swift.org ver�ffentlicht wurden. https://developer.apple.com/documentation/foundation
* COpenSSL bietet verschieden Verschl�sselungstechniken und SSL/TLS Methoden zur Verf�gung die auf Linux in C installiert werden (Dieses Paket wurde nicht verwendet) https://github.com/PerfectlySoft/Perfect-COpenSSL
* HTTP bietet verschiedene Strukturen und Methoden um mit http Clients zu kommunizieren. Diese Paket muss mit "import PerfectHTTP" im Projekt eingebunden werden https://github.com/PerfectlySoft/Perfect-HTTP
* HTTPServer bietet die Hauptstrukturen f�r HTTP 1.1 und HTTP 2 server und ist die Hauptabh�ngigkeit f�r das Projekt und muss mit "import PerfectHTTPServer" eingebunden werden https://github.com/PerfectlySoft/Perfect-HTTPServer
* PerfectLib ist das Herz des Perfect Frameworks und ist ohne nicht lauff�hig. Muss ebenfalls mit "import PerfectLib" eingebunden werden. https://github.com/PerfectlySoft/Perfect
* LinuxBridge bildet die Br�cke zwischen Perfect und den Linux Distriputionen https://github.com/PerfectlySoft/Perfect-LinuxBridge
* Net ist ein networking Paket welches TCP, SSL, UNIX Socket files und IO Event Handling zur Verf�gung stellt. https://github.com/PerfectlySoft/Perfect-Net

===zus�tzliche Packages===

* Perfect-Logger und Perfect-RequestLogger sind Pakete die zum Loggen von Informationen auf die Konsole oder in ein Log File. der RequestLogger ist eine Kindklasse vom Logger und f�ngt durch das einbinden von Filtern alle Request und logged diese mit. https://github.com/PerfectlySoft/Perfect-RequestLogger
* Perfect-Session wurde verwendet um einen Session zu starten, verwalten und wieder zu vernichten. https://github.com/PerfectlySoft/Perfect-Session
* Perfect-Websockets bietet eine Funktionen zum Aufbauen von WebSocket-Verbindungen
* SwiftyBeaver bietet verschiede Verschl�sselungstechniken f�r Passw�rter oder anderen empfindlichen Daten https://medium.com/swiftybeaver-blog/logging-in-server-side-swift-85bdecb6be80

===Wichtige Punkte der Implementierung===

===Linux===
Das Projekt soll nur auf Linux laufen deshalb wurde am Anfang folgender Code eingebunden, welcher das Betriebssystem �berpr�ft und beendet sollte es kein Linux sein:
<blockquote>
	#if !os(Linux)<br/>
	import Glibc<br/>
	print("We are sorry this is only meant to be run on Linux")<br/>
	exit(1)<br/>
	#endif<br/>
</blockquote>

====Session Verwaltung====
Bei der Session sind verschieden Konfigurationen m�glich. Zu beachten ist jedoch, dass die cookieDomain, die festgelegt werden kann, w�hrend der Entwicklung nicht festgelegt werden darf. Erst wenn der Server gehostet wird, kann die Domain angepasst werden, was jedoch nicht n�tig ist, da mit das IPAddressLock und der userAgentLock eingeschalten sind.

<blockquote>
	SessionConfig.name = "mobileExtendSession" //Session name which is set as cookie<br/>
	SessionConfig.idle = 86400  // idle time set to one day<br/>
	// Optional<br/>
	//SessionConfig.cookieDomain = "localhost"<br/>
	SessionConfig.IPAddressLock = true //Session is bind to the IP address of the first request<br/>
	SessionConfig.userAgentLock = true //Session is bind to the user<br/>
</blockquote>

===JSON===
Objekte die als JSON serialisiert werden sollen, m�ssen von der Klasse JSONConvertibleObject erben, sowie die Methoden "setJSONValues" und "getJSONValues" m�ssen �berschrieben bzw definiert werden. Zus�tlich zu den �blichen Attributen des Objektes kommt ein Registrierungsname zum Einsatz. Dieser dient als Schl�ssel f�r die Objektklasse und als Registrierungsschl�ssel im Register der JSON-Decodable-Object Referenz. Mit diesem Schl�ssel kann die Decodierung eines JSON Strings erfolgen und wird dem Objekt, dass erstellt werden soll zugeteilt.

<blockquote>
	public class Profile: JSONConvertibleObject {<br/>
	static let registerName = "profile"<br/>
	&#160;&#160;&#160;&#160;var username = ""<br/>
	&#160;&#160;&#160;&#160;var password = ""<br/>
	....<br/>
	....<br/>
	override public func setJSONValues(_ values: [String: Any]) {<br/>
	&#160;&#160;&#160;&#160;self.username = getJSONValue(named: "username", from: values, defaultValue: "")<br/>
	&#160;&#160;&#160;&#160;self.password = getJSONValue(named: "password", from: values, defaultValue: "")<br/>
	&#160;&#160;&#160;&#160;self.firstname = getJSONValue(named: "firstname", from: values, defaultValue: "")<br/>
	....<br/>
	....<br/>
	override public func getJSONValues() -> [String: Any] {<br/>
	return &#91;<br/>
	&#160;&#160;&#160;&#160;JSONDecoding.objectIdentifierKey: Profile.registerName,<br/>
	&#160;&#160;&#160;&#160;"username": username,<br/>
	&#160;&#160;&#160;&#160;"password": password,<br/>
	&#160;&#160;&#160;&#160;...<br/>
	&#160;&#160;&#160;&#160;&#93;<br/>
	....<br/>
	....<br/>
</blockquote>

Wichtig ist auch das die Objekt beim Start des Servers als JSONDecodable registriert werden m�ssen:

<blockquote>
	JSONDecoding.registerJSONDecodable(name: Profile.registerName, creator: {return Profile()})<br/>
</blockquote>

===working Directory===
Beim setzen des Working Directory ist zu beachten, dass solange der Server nicht neu gestartet wird, nicht mehr im Verzeichnisbaum nach oben g�ndert werden kann, nur nach unten. Deshalb sollte das Working Direktory vom Standardwert Sources, nur maximal in ein Unterverzeichnis, wie bei unserem Server, dem Verzeichnis "exe", ge�ndert werden. Beim Setzen des Working Directory wird der Ausf�hrungsprozess in ein darunterliegendes Verzeichnis verschoben.

<blockquote>
	func setupDir(_: Void) -> Void {<br/>
	&#160;&#160;&#160;&#160;let workingDir = Dir("./Sources/exe")<br/>
	&#160;&#160;&#160;&#160;if workingDir.exists {<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;do {<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;try workingDir.setAsWorkingDir()<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;LogFile.debug("Working directory set to \(workingDir.name)")<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;} catch {<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;LogFile.debug("error in getFile() setting WorkingDir: \(error)")<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;}<br/>
	&#160;&#160;&#160;&#160;} else {<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;LogFile.error("Directory \(workingDir.path) does not exist. Main executable not started from root of MVC cannot find resources?")<br/>
	&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;exit(2)<br/>
	&#160;&#160;&#160;&#160;}<br/>
	&#160;&#160;&#160;&#160;issetup = true<br/>
	}<br/>
	var issetup = false<br/>
</blockquote>

{{SwiftOnLinux Footer}}
