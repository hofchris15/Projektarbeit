==Installation von Swift==

Da Swift eine Sprache ist, die vorr�ngig f�r MacOS erstellt wurde, ist es erst mit ein wenig Aufwand auf Linux Distributionen lauff�hig. Dazu muss die Toolchain von <span class="plainlinks">[https://swift.org/download/#releases Swift.org ] </span> in ein Verzeichnis geladen werden und je nach Wunsch in der Systemumgebung definiert werden. Eine genaue Installationsanleitung kann ebenfalls unter <span class = "plainlinks">[https://swift.org/getting-started/ Swift.org ]</span> nachgelesen werden. F�r die Code Beispiele ist der "user" gegen den tats�chlichen Username auszutauschen. Um dies zu vereinfachen ist der Username unseres Beispielusers "user".
Lade die aktuelle stabile Toolchain auf der Download Seite von <span class="plainlinks">[https://swift.org/download/#releases Swift.org ] </span> herunter und speichere es in einem beliebigen Verzeichnis z.B. im Downloads-Verzeichnis des aktuellen Users.  
Danach muss <span class="plainlinks">[http://clang.org/ clang]</span> installiert werden, um das Compilieren von Swift Programmen zu erm�glichen. Dies ist mit dem Befehl auf einer Linux Bash m�glich<ref name="swiftStart">{{Internetquelle|autor=Apple Inc |jahr=2017 |titel=Getting Started |url=https://swift.org/getting-started/#installing-swift |datum=ohne Datum |zugriff=2017-07-26}} Apple Inc (2017f): Getting Started, [online] https://swift.org/getting-started/#installing-swift [27.07.2017].</ref>:

<code>sudo apt-get install clang</code>

Danach muss die heruntergeladenen Swift Toolchain in ein geeignetes Verzeichnis extrahiert werden und der PATH Variable hinzugef�gt werden.
Dazu erstellen wir im ersten Schritt das Verzeichnis "install" im user Home-Verzeichnis

<code>sudo mkdir /home/user/install</code>

Entpacken der Toolchain in das zuvor erstellte "install" Verzeichnis:

<code>sudo tar -xf /home/user/Downloads/swift-3.1.1-RELEASE-ubuntu16.10.tar.gz -C /home/user/install</code>

Um das Ausf�hren von Swift leichter zu gestalten, kann Swift der PATH-Variable tempor�r hinzugef�gt werden:

<code>export PATH=${PATH}:/home/user/install/swift-3.1.1-RELEASE-ubuntu16.10/usr/bin</code>

Um dauerhaft, z.B. nach einem Neustart, Swift im Terminal zur Verf�gung zu haben, kann der Pfad zur Toolchain in die Datei /etc/environment eingetragen werden.
Dazu wird die Datei environment mit einem Texteditor, in unserem Fall "VIM" ge�ffnet und erweitert:

<code>sudo vim /etc/environment</code>

und folgender Text angef�get:

''''':/home/user/install/swift-3.1.1-RELEASE-ubuntu16.10/usr/bin''''' 

Danach sollte die Installation mit der Ausgabe der Version von Swift �berpr�ft werden:

<code>swift --version</code>

welches die Ausgabe:

<code>Swift version 3.1.1 (swift-3.1.1-RELEASE)</code>

zur Folge hat. 
Eventuell m�ssen die Besitzrechte des Swift-Installationsordner ge�ndert werden, um Zugriffrechte zu gew�hren. Dazu wird folgender Befehl auf den Ordner angewandt:<br/>
<code>sudo chown -R user:user ~/install/swift-3.1.1-RELEASE-ubuntu16.10/</code>

Damit ist die Installation abgeschlossen.

===Swift REPL===
Swift bietet bei dieser Installation ein Terminal Tool namens Swift-REPL (Swift-Read-eval-print-loop), welches es erm�glicht, Swift direkt auf der Konsole zu testen und auszuf�hren.
Da dies f�r das Ausf�hren des Servers nicht notwendig ist, wird hier darauf nicht n�her eingegangen, dazu aber jedenfalls mehr auf <span class = "plainlinks">[https://swift.org/getting-started/ Swift.org ]</span>.<ref name="SwiftREPL">{{Internetquelle|autor=Apple Inc |jahr=2017c |titel=Using the REPL |url=https://swift.org/getting-started/#using-the-repl |datum=ohne Datum |zugriff=2017-07-26}} Apple Inc (2017c): Using the REPL, [online] https://swift.org/getting-started/#using-the-repl [26.07.2017].</ref>

===Swift Package Manager===
Der Package Manager ist eine M�glichkeit ein Skeleton f�r ein Projekt zu erstellen. Der Package Mangaer erstellt einen Verzeichnisbaum, der eine gewisse Grundstruktur erm�glicht. Diese Struktur wird auf <span class = "plainlinks">[https://swift.org/getting-started/ Swift.org ]</span> noch in der Version 3.0 beschrieben, jedoch �nderte sich dies mit dem RELEASE von Version 3.1.
Zuerst wird ein Verzeichnis erstellt, dass das neue Projekt repr�sentiert und in weiterer Folge als Projektordner bezeichnet wird.
<blockquote>
	<code>mkdir Hello</code><br/>
	<code>cd Hello</code><br/>
	<code>swift package init</code><br/>
</blockquote>
Mit dem Ausf�hren des Init-Befehls wird unter anderem eine Package.swift Datei erstellt, in dem alle Abh�ngigkeiten des Projektes gespeichert werden. Weiter wird ein Verzeichnis Sources erstellt, in dem sich nur .swift-Dateien befinden d�rfen. Im Verzeichnis Tests befinden sich die Testklassen<ref name="SwiftPackageManager">{{Internetquelle|autor=Apple Inc |jahr=2017 |titel=Using the Package Manager |url=https://swift.org/getting-started/#using-the-package-manager |datum=ohne Datum |zugriff=2017-07-26}}
Apple Inc (2017d): Using the Package Manger, [online] https://swift.org/getting-started/#using-the-package-manager [26.07.2017].</ref>.

<blockquote>
+--Package.swift<br/>
+--Sources<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--Hello.swift<br/>
+--Tests<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--HelloTests<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--HelloTests.swift<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--LinuxMain.swift<br/>
</blockquote>

Sollte eine Strukturierung z.B. mit Hilfe von Ordner in Sources erfolgen, ist direkt unter dem Sources Verzeichnis ein weiteres Verzeichnis z.B. "exe" anzulegen, in dem die gew�nschte Ordnerstruktur z.B. f�r ein MVC-Pattern erstellt werden kann. Es ist aufgrund des Compilers und der Modularit�t nicht m�glich, mehrere Ordner und .swift-Dateien gemischt im Sources-Verzeichnis zu compilieren. Dies liegt daran, dass der Compiler Verzeichnisse als Module versteht und jeweils nur ein Modul erstellt werden kann. Daher compiliert er nur den ersten gefundenen Ordner.
====Falsche Struktur====

<blockquote>
+--Package.swift <br/>
+--Sources<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--model<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--fileHandler.swift<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--view<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--renderView.swift<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--controller<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--router.swift<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--main.swift<br/>
+--Tests<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--FileTests<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--FileHandlerTests.swift<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+---LinuxMain.swift<br/>
</blockquote>
====Richtige Struktur====

<blockquote>
+--Package.swift<br/>
+--Sources<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--exe<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--model<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--fileHandler.swift<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--view<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--renderView.swift<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--controller<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--router.swift<br/>
�&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--main.swift<br/>
+--Tests<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--FileTests<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;�&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--FileHandlerTests.swift<br/>
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;+--LinuxMain.swift<br/>
</blockquote>

===Swift compiling===
<ref name="AppleCompiler">{{Internetquelle|autor=Apple Inc |jahr=2017 |titel= Compiler and Standard Library|url=https://swift.org/compiler-stdlib/#compiler-architecture |datum=ohne Datum |zugriff=2017-07-26}} Apple Inc (2017e): Compiler and Standard Library, [online] https://swift.org/compiler-stdlib/#compiler-architecture [26.07.2017].</ref>
Der Swift Compiler kann mit dem Befehl

<code>swift build</code>

gestartet werden, dazu muss man sich im Projektordner befinden. Durch das Aufrufen des Compilers werden die im Package.swift eingetragenen Abh�ngigkeiten z.B. von Github heruntergeladen und compiliert. Dabei wird das Verzeichnis ".build" erstellt, in dem sich der ausf�hrbare Code befindet. Erst danach wird der eigene produzierte Code compiliert und ebenfalls ins Verzeichnis "/.build/debug" gespeichert. Das Compilieren von Abh�ngigkeiten erfolgt nur einmal nach dem Download oder dem Download von Aktualisierungen. Die Packages werden im Ordnerbaum abgespeichert, damit sie nicht bei jedem Compilieren heruntergeladen werden m�ssen. In der alten Version 3.0 wurde dazu ein eigenes Verzeichnis "Packages" angelegt und die aus Github ausgecheckten Module in Form von Source Code gespeichert. Seit dem Update auf die Version 3.1 wird dieses Verzeichnis "Packages" im �berverzeichnis ".build" mit abgespeichert. Auch hier ist der Source Code der Module zu finden. Der Compiler ingnoriert beim Compilieren grunds�tzlich alle Verzeichnisse ab dem Sources-Ordner, was zur Folge hat, dass Swift-Dateien bzw. Klassen nicht wie in bekannten anderen Sprachen z.B. mit einem "import"-Befehl zur Verf�gung gestellt werden m�ssen, sondern automatisch als eine gro�e Swift-Datei angesehen werden.

Der Swift Compiler unterst�tzt die Systemsprachen von C und Objective-C, was durch den Clang Importer erreicht wird. Der Clang-Importer importiert Clang-Module, die die C und Objective-C APIs auf die Swift APIs mappen, wodurch das Compilieren auf Linux bewerkstelligt wird.

==Server installieren==

Der Server wird auf Github ausgecheckt und compiliert. Davor k�nnen zwei Einstellungen in der Config.swift eingestellt werden. Der Host vorab auf "localhost" eingestellt und der Port der vorab auf "3000" eingestellt ist. Das Projekt ist unter <span class = "plainlinks">[https://github.com/hofchris15/Projektarbeit.git Github/Projekt ]</span> mit Git auszuchecken oder als zip herunterladen. In diesem Repository befindet sich der Ordner NodeServer, in dem der Reverenz-Server in JavaScript mit Node und Express.js geschrieben ist. Im Ordner SwiftServer befindet sich der in Swift geschriebene Server, der f�r diese Installation relevant ist. Damit der Server l�uft, ist der Node-Server irrelevant, sodass dieser gel�scht werden oder ausgef�hrt werden kann wie im Kapitel "Installation Node Server" beschrieben ist.

===Installation mit Git===

<blockquote>
	<code>mkdir SwiftServer</code><br/>
	<code>cd SwiftServer</code><br/>
	<code>git clone https://github.com/hofchris15/Projektarbeit.git</code><br/>
	<code>swift build</code> 

	oder 

	<code>swift build --configuration release</code><br/>
</blockquote>

Mit dem ersten Befehl wird in einem beliebigen Verzeichnis der Ordner SwiftServer erstellt, der als Projektordner dient. Danach wechselt man in das Verzeichnis und checkt den Server von Github aus. Danach liegt der Server in Form von Source Code im Verzeichnis "SwiftServer" auf und kann mit dem letzten Befehl compiliert werden. Mit diesem Kommando wird eine debug Compilierung durchgef�hrt, was f�r die Entwicklung ben�tigt wird, da mehr Informationen w�hrend der Laufzeit an den Entwickler ausgegeben werden. Um den Server jemanden au�erhalb des Entwicklungsbereichs zu �bergeben, wird empfohlen den Compiler auf den release-Modus zu stellen. Dazu wird der Befehl <code>swift build --configration release</code> ausgef�hrt. Je nach Compiler-Konfiguration wird das Produkt im Verzeichnis .build/debug/exe oder .build/release/exe abgelegt.
Damit ist die Installation des Servers abgeschlossen und der Server kann gestartet werden. 

===Installation ohne Git===
Der Ablauf ohne Git ist geringf�gig anders als bei der Installation mit Git. Dazu wird der Server als .zip-Archiv von Github heruntergeladen und in das zuvor erstellte Verzeichnis "SwiftServer" entpackt. 

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
Der Server kann �ber ein Terminal gestartet werden, nachdem dieser compiliert wurde siehe auch: [[Installation von Swift#Server installieren]] <br/>
Danach kann der Server mit nachfolgenden Kommandos gestartet werden. Einzige Voraussetzung ist, das man sich bereits mit dem Terminal im Projektordner befindet.

<code> ./.build/debug/exe <code>

oder mit 

<code>./.build/release/exe</code>

Danach sollte folgende Ausgabe auf dem Terminal angezeigt werden:

<blockquote>
	[DBG] init HTTPServer()<br/>
	[DBG] makeRoutes()<br/>
	[INFO] set config<br/>
	[INFO] Starting HTTP server on 0.0.0.0:3000<br/>
</blockquote>

Mit der letzten Zeile wird dar�ber informiert, dass der Server gestartet wurde und auf dem Port 3000 h�rt. Somit kann dieser mit einem beliebigen Browser angesteuert werden. Dazu wird in die Adressleiste <small>localhost:3000</small> eingegeben und es sollte die Login-Seite des Services angezeigt werden. 

Weiter mit einigen Details zum Server und den Packages, die verwendet werden. 

==Details zum Server==

Der Server entstand in Zusammenhang mit der Lehrveranstaltung "Projektarbeit" der FH Joanneum Kapfenberg Studienrichtung Software Design, mit dem Thema Swift on Linux. 
Dazu wurde von uns recherchiert und zwei interessante Frameworks f�r die Entwicklung eines Servers ausgew�hlt. Diese beiden Frameworks sind <span class = "plainlinks">[http://www.kitura.io/ Kitura.io ]</span>und <span class = "plainlinks">[http://perfect.org/ Perfect]</span>.
Grunds�tzlich sind beide Frameworks sehr �hnlich, wobei hierbei einige Punkte zu beachten sind <ref name="Kitura">{{Internetquelle|autor=IBM |jahr=o.J.a |titel= Setting Up |url=http://www.kitura.io/en/starter/settingup.html |datum=ohne Datum |zugriff=2017-07-26}} IBM (o.J.): Setting Up, [online] http://www.kitura.io/en/starter/settingup.html [26.07.2017].</ref> <ref name="PerfectAbout">{{Internetquelle |autor=Sean Stephens, Kyle Jessup, Lucas Chang, Jonathan Guthrie |jahr=o.J. |titel=What Is Perfect |url=http://perfect.org/about.html |datum=ohne Datum |zugriff=2017-07-26}} Jessup, Kyle / Stephens, Sean / Chang, Lucas / Guthrie, Jonathan (o.J.): What Is Perfect, [online] http://perfect.org/about.html [26.07.2017].</ref>:<br />
* Kitura ist ein Framework, das von IBM erstellt wurde und auf MAC sowie auf Linux lauff�hig ist. Perfect wurde von PerfectlySoft Inc einem kleinem Startup Unternehmen, das sich auf die Entwicklung mit Swift spezialisiert hat, entwickelt. <br />
* IBM's Kitura hat eine grunds�tzliche Bibliothek, die verwendet wird, um einen HTTP Server umzusetzen sowie einige Packages, um die Funktionalit�t zu erweitern. Perfect setzt auf das selbe Prinzip wie Kitura und h�lt wie auch Kitura ein Template als Startpunkt f�r den Server zur Verf�gung. <br />
* Kitura ist f�r die Swift Versionen 3.1 entwickelt, Perfect f�r Swift Versionen der 3.0 Reihe. Leider gibt es f�r Perfect zu Swift 3.1 kein Update.<br />
* Kitura und Perfect halten beide eine Documentation bereit, die ausf�hrlich erscheint jedoch bei Perfect mehr Informationen bereit hielt.<br /><br />

Schlussendlich haben wir uns f�r Perfect entschieden. Gr�nde daf�r waren, der eben erw�hnte Punkt der Dokumentation, und das Perfect bereits l�nger auf dem Markt vorhanden ist. 
Viele Beispiele, Bibliotheken und Packages werden von PerfectlySoft auf deren Github Account gehostet: <span class = "plainlinks">[https://github.com/PerfectlySoft PerfectlySoft on Github ]</span>

===Installation von Perfect===

Auch Perfect setzt einige Pakete auf Linux voraus, darunter openssl, libssl-dev und uuid-dev. Diese k�nnen sehr leicht mit 

<code> sudo apt-get install openssl libssl-dev uuid-dev</code> 

installiert werden<ref name="PerfectlySoft">{{Internetquelle|autor=Kyle Jessup et al. |jahr=2017a |titel=Getting Started|url=https://github.com/PerfectlySoft/PerfectDocs/blob/master/guide/gettingStarted.md |datum=2017-05-19 |zugriff=2017-07-27}} Jessup, Kyle / Stephens, Sean / Chang, Lucas / Guthrie, Jonathan (2017a): Getting Started, [online] https://github.com/PerfectlySoft/PerfectDocs/blob/master/guide/gettingStarted.md [27.07.2017].</ref>. 

===Perfect Template ===
Das Perfect Template wurde von uns als Ausgangspunkt der Entwicklung des HTTP Servers im MVC-Pattern gew�hlt. Als Reverence wurde von uns der selbe Server zuvor mit <span class = "plainlinks">[https://nodejs.org/en/  Node.js ]</span> und dem Framework <span class = "plainlinks">[http://expressjs.com/de/  Express.js ]</span> implementiert.
Das Perfect Template h�lt die Standard Baumstruktur des swift init-Prozesses bereit, die bereits in der [[Installation von Swift#Swift Package Manager]] vorgestellt wurde. Weiter befinden sich ein Datei names "main.swift" im Sources Verzeichnis, die die Initalisierung eines Servers enth�lt. Interressant ist jedoch, die in der Package.swift enhaltene Abh�ngigkeit <span class = "plainlinks">[https://github.com/PerfectlySoft/Perfect-HTTPServer.git ]</span>. Der Perfect-HTTPServer hat einige sehr n�tzliche Abh�ngigkeiten, die auch wir im Server verwendet haben.

===Die wichtigsten Packages=== 
Wie oben beschrieben sind einige Packete grunds�tzlich notwendig um den Server ins Laufen zu bekommen. Diese Grund-Pakete sind PerfectLib COpenSSL, HTTP, HTTPServer, PerfectLib, LinuxBridge und Net<ref name="Perfectorg">{{Internetquelle|autor=Sean Stephens, Kyle Jessup, Lucas Chang, Jonathan Guthrie|jahr=o.J.b |titel=Documentation|url=https://www.perfect.org/docs/ |datum=ohne Datum|zugriff=2017-07-27}} Jessup, Kyle / Stephens, Sean / Chang, Lucas / Guthrie, Jonathan (o.J.): Documentation, [online] https://www.perfect.org/docs/ [27.07.2017].</ref>.
* Foundation ist die Standardbibliothek von Swift und bietet die gruns�tzlichen Funktionen und Definition wie Strings, Numbers usw. die von der Swift.org ver�ffentlicht wurden. https://developer.apple.com/documentation/foundation
* COpenSSL bietet verschiedene Verschl�sselungstechniken und SSL/TLS Methoden zur Verf�gung, die auf Linux in C installiert werden (Dieses Paket wurde nicht verwendet). https://github.com/PerfectlySoft/Perfect-COpenSSL
* HTTP bietet verschiedene Strukturen und Methoden, um mit http Clients zu kommunizieren. Dieses Paket muss mit "import PerfectHTTP" im Projekt eingebunden werden. https://github.com/PerfectlySoft/Perfect-HTTP
* HTTPServer bietet die Hauptstrukturen f�r HTTP 1.1 und HTTP 2 Server und ist die Hauptabh�ngigkeit f�r das Projekt und muss mit "import PerfectHTTPServer" eingebunden werden https://github.com/PerfectlySoft/Perfect-HTTPServer
* PerfectLib ist das Herz des Perfect Frameworks und ist ohne nicht lauff�hig. Muss ebenfalls mit "import PerfectLib" eingebunden werden. https://github.com/PerfectlySoft/Perfect
* LinuxBridge bildet die Br�cke zwischen Perfect und den Linux Distriputionen https://github.com/PerfectlySoft/Perfect-LinuxBridge
* Net ist ein networking Paket welches TCP, SSL, UNIX Socket files und IO Event Handling zur Verf�gung stellt. https://github.com/PerfectlySoft/Perfect-Net

===Zus�tzliche Packages=== 
Einige f�r die Server wichtige zus�tzliche Packages<ref name="Perfectorg" />:
* Perfect-Logger und Perfect-RequestLogger sind Pakete, die zum Loggen von Informationen auf die Konsole oder in ein Log File. Der RequestLogger ist eine Kindklasse vom Logger und f�ngt durch das Einbinden von Filtern alle Requests und logged diese mit, sieh auch: https://github.com/PerfectlySoft/Perfect-RequestLogger
* Perfect-Session wurde verwendet um einen Session zu starten, zu verwalten und wieder zu vernichten. https://github.com/PerfectlySoft/Perfect-Session
* Perfect-Websockets bietet eine Bibliothek zum Aufbauen von WebSocket-Verbindungen
* SwiftyBeaver<ref name="SwiftyBeaver">{{Internetquelle|autor=Sebastian Kreutzberger|jahr=2017|titel=AES256CBC.swift|url=https://github.com/SwiftyBeaver/AES256CBC/blob/master/Sources/AES256CBC.swift|datum=2017-07-25|zugriff=2017-07-27}} Kreutzberger, Sebastian (2017): AES256CBC.swift, [online] https://github.com/SwiftyBeaver/AES256CBC/blob/master/Sources/AES256CBC.swift [27.07.2017].</ref> bietet verschiedene Verschl�sselungstechniken f�r Passw�rter oder anderen empfindliche Daten.https://medium.com/swiftybeaver-blog/logging-in-server-side-swift-85bdecb6be80

===Wichtige Punkte der Implementierung===

====Linux====
Das Projekt soll nur auf Linux laufen, deshalb wurde am Anfang folgender Code eingebunden, welcher das Betriebssystem �berpr�ft und beendet, sollte es kein Linux sein:
<blockquote>
	#if !os(Linux)<br/>
	import Glibc<br/>
	print("We are sorry this is only meant to be run on Linux")<br/>
	exit(1)<br/>
	#endif<br/>
</blockquote>

====Session Verwaltung====
Bei der Session sind verschiede Konfigurationen m�glich. Zu beachten ist jedoch, dass die cookieDomain, die festgelegt werden kann, w�hrend der Entwicklung nicht festgelegt werden darf. Erst wenn der Server gehostet wird, kann die Domain angepasst werden, was jedoch nicht n�tig ist, damit das IPAddressLock und der userAgentLock eingeschalten sind.

<blockquote>
	SessionConfig.name = "mobileExtendSession" //Session name which is set as cookie<br/>
	SessionConfig.idle = 86400  // idle time set to one day<br/>
	// Optional<br/>
	//SessionConfig.cookieDomain = "localhost"<br/>
	SessionConfig.IPAddressLock = true //Session is bind to the IP address of the first request<br/>
	SessionConfig.userAgentLock = true //Session is bind to the user<br/>
</blockquote>

====JSON====
Objekte, die als JSON serialisiert werden sollen, m�ssen von der Klasse JSONConvertibleObject erben, sowie die Methoden "setJSONValues" und "getJSONValues" �berschreiben. Zus�tzlich zu den �blichen Attributen des Objektes kommt ein Registrierungsname zum Einsatz. Dieser dient als Schl�ssel f�r die Objektklasse und als Registrierungsschl�ssel im Register der JSON-Decodable-Object Referenz. Mit diesem Schl�ssel kann die Decodierung eines JSON Strings erfolgen und wird dem Objekt, das erstellt werden soll, zugeteilt.

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

Wichtig ist auch, dass die Objekt beim Start des Servers als JSONDecodable registriert werden m�ssen:

<blockquote>
	JSONDecoding.registerJSONDecodable(name: Profile.registerName, creator: {return Profile()})<br/>
</blockquote>

====Working Directory====
Beim Setzen des Working Directory ist zu beachten, dass, solange der Server nicht neu gestartet wird, nicht mehr im Verzeichnisbaum nach oben ge�ndert werden kann, nur nach unten. Deshalb sollte das Working Direktory vom Standardwert Sources nur maximal in ein Unterverzeichnis, wie bei unserem Server, dem Verzeichnis "exe", ge�ndert werden. Beim Setzen des Working Directory wird der Ausf�hrungsprozess in ein darunterliegendes Verzeichnis verschoben.

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
