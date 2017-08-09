==JavaScript als Reverenz==

===JavaScript und Node.js===
Urspr�nglich wurde JavaScript als Teil vom Webbrowsern implementiert, um clientseitig Skripte auszuf�hren. Dabei soll dem Anwender eine Schnittstelle f�r interaktives Web geboten werden, asynchrone Anfragen gestllt und der Dokumenteninhalt ver�ndert werden k�nnen. 
Die Sprache war in der Vergangenheit sehr negativ besetzt und hat auch heute noch bei vielen einen negativen Beigeschmack. Leider wird oft die Entwicklung von JavaScript in den letzten Jahren au�er Acht gelassen, wo sich JavaScript immer mehr Richtung "Unverzichtbarkeit" gearbeitet hat. Derzeit ist JavaScript beinahe auf jeder WebSite und Webanwendung vertreten. Fr�her als Spielzeug bezeichnet, ist es heute ein beliebtes Werkzeug, um dynamische WebSites zu erstellen und es Usern zu erm�glichen, interaktiv im Browser und im Internet unterwegs zu sein. Auch gro�e Firmen wie Mozilla, Google, Microsoft und Apple setzen mittlerweile auf JavaScript<ref name="t3n">{{Internetquelle|autor=Felix Gelsend�rfer|jahr=2010|titel=Wie Node.js JavaScript auf dem Server revolutioniert: Schubrakete f�r JavaScript|url=http://t3n.de/magazin/nodejs-javascript-server-revolutioniert-schubrakete-226177/ |datum=2010-12-08 |zugriff=2017-07-27}} Gelsend�rfer, Felix (2010): Wie Node.js JavaScript auf dem Server revolutioniert: Schubrakete f�r JavaScript, [online] http://t3n.de/magazin/nodejs-javascript-server-revolutioniert-schubrakete-226177/ [27.07.2017].</ref>. Mittlerweile ist die Sprache prototypenbasiert, dynamisch und typensicher. Grundlage f�r JavaScript bildet die Skriptsprache C sowie sehr viele Begriffsstandards von Java<ref name="SEOAnalyse">{{Internetquelle|autor=Fuchs Media Solutions|jahr=o.J.|titel=JavaScript Begriffserkl�rung und Definition|url=https://www.seo-analyse.com/seo-lexikon/j/javascript/ |datum=ohne Datum| zugriff=2017-07-27}} Fuchs Media Solutions (o.J.): JavaScript Begriffserkl�rung und Definition, [online] https://www.seo-analyse.com/seo-lexikon/j/javascript/ [27.07.2017].</ref>.
JavaScript am Server auszuf�hren, ist seit Entstehung der Sprache eine laufende Idee von JavaScript Entwicklern und wurde bereits ein Jahr nach Entwicklung 1996 umgesetzt. Der Druchbruch gelang aber erst am 8. November 2009 als Ryan Dahl Node.js vorstellte, dass bis heute immer beliebter wird. Mittlerweile gibt es sehr viele Tutorials, die es erm�glichen, JavaScript und Node.js zu lernen und auch sehr viele Beispiele um diese Sprache und das Framework zu erlernen. 

=== Pros and Cons===

<table>
	<tr>
		<th>Pros of JavaScript</th>
		<th>Cons of JavaScript</th>
		<th>Pros of Node.js</th>
		<th>Cons of Node.js</th>
	</tr>
	<tr>
		<td>Benutzer freundlichere Websites</td>
		<td>JavaScript kann clientseitig deaktiviert werden</td>
		<td>Open source server Framework<ref name="w3schoolnodejs">{{Internetquelle|autor=Refnes Data|jahr=2017|titel=Node.js Introduction|url=https://www.w3schools.com/nodejs/nodejs_intro.asp |datum=ohne Datum |zugriff=2017-07-27}} Refnes Data (2017b): Node.js Introduction, [online] https://www.w3schools.com/nodejs/nodejs_intro.asp [27.07.2017].</ref></td>
		<td>Un�bersichtlichkeit der Community und der Entwicklung, durch sehr schnelles Wachstum<ref name="codecentricde">{{Internetquelle|author=Gregor Elke|jahr=2014|title=Ist Node.js ein Superheld? [online]|url=https://blog.codecentric.de/2014/06/ist-node-js-ein-superheld/ |datum=2014-06-19|zugriff=2017-07-27}} Elke, Gregor (2014): Ist Node.js ein Superheld?, [online] https://blog.codecentric.de/2014/06/ist-node-js-ein-superheld/ [27.07.2017].</ref></td>
	</tr>
	<tr>
		<td>Dynamischer Inhalt von Websites</td>
		<td>Wenn deaktiviert, oft negative Auswirkungen</td>
		<td>lauff�hig auf Windows, Linux, Unix, Mac OS X, ...<ref name="w3schoolnodejs"/></td>
		<td>Modulsytem verbraucht viel Speicher<ref name="codecentricde" /></td>
	</tr>
	<tr>
		<td>objekt-basiert, prototyping f�r Vererbung</td>
		<td>urspr�nglich keine Vererbung</td>
		<td>Verwendung von serverseitigen JavaScript<ref name="codecentricde" /></td>
		<td>nur ein Prozess mit einem Speicher von 1,7 GB <ref name="codecentricde" /></td>
	</tr>
	<tr>
		<td>Objekt-Referenzen werden erst zur Laufzeit gepr�ft<ref name="MathematikUniUlm">{{Internetquelle|autor=o.V.|jahr=o.J.|titel=Gefahren und Anwendungsm�glichkeiten durch JavaScript|url=http://www.mathematik.uni-ulm.de/sai/ws01/portalsem/wiede/ |datum=ohne Datum|zugriff=2017-07-27}} o.V. (o.J.): Gefahren und Anwendungsm�glichkeiten druch JavaScript, [online], http://www.mathematik.uni-ulm.de/sai/ws01/portalsem/wiede/ [27.07.2017].</ref></td>
		<td>schwach typisierte Variablen<ref name="MathematikUniUlm"/></td>
		<td>Asynchron, event basiert<ref name="codecentricde" /></td>
		<td>ben�tigt clustering um gro�e Mengen abzuarbeiten<ref name="codecentricde" /></td>
	</tr>
	<tr>
		<td>einfache prozeduale Sprache<ref name="MathematikUniUlm"/></td>
		<td>kein natives Modulsystem<ref name="codecentricde" /></td>
		<td>einbinden von C und C++ libraries<ref name="codecentricde" /></td>
		<td>nicht alle libraries von C und C++ verf�gbar<ref name="codecentricde" /></td>
	</tr>
</table>

===ECMAScript===

JavaScript wurde in der <span class = "plainlinks">[http://www.ecma-international.org/ ECMA]</span> (European association for standardizing information and communication systems) spezifiziert. Der Name "ECMAScript" wurde deshalb gew�hlt, weil Netscape und Microsoft sich nicht auf einen gemeinsamen Namen f�r die eigenst�ndigen Sprachen "JScript und JavaScript" einigen konnten. Jedoch wurde dieser Name nie weitl�ufig zur Gewohnheit, weil Brendan Eich, Erfinder von JavaScript meinte, dass dies "wie eine Hautkrankheit" klinge<ref name="Schr�dinger lernt HTML5, CSS3 & JavaScript">{{cite book|author=Kai G�nster|jahr=2013|title=Schr�dinger lernt HTML5, CSS3 & JavaScript|isbn=978-3-8362-2020-0|publisher=Galileo Computing|zugriff=2017-07-27}} G�nster, Kai (2013): ''Schr�dinger lernt HTML5, CSS3 & JavaScript: das etwas andere Fachbuch'', Bonn: Galileo Press.</ref>. Entwickler k�nnen die offene Sprache zum Entwickeln von Programmen nutzen und dabei sicher gehen, dass der Code unterst�tzt wird, wenn dieser den Standard einh�lt. 

=== Swift vs. JavaScript=== 

====Ziel der Entwicklung====
Ein gro�r Unterschied bei den beiden Sprachen liegt im Ziel der Entwicklung der Sprachen. JavaScript wurde entwickelt mit dem Ziel, statisches HTML und CSS im Web, dynamischer zu gestalten und dem Client ein interaktives Web zu bieten. JavaScript ist beinahe auf jeder Website zu finden und auch nicht mehr wegzudenken<ref name="devMozilla">{{Internetquelle|autor=Mozilla Developer and individual contributors |jahr=2017|titel=JavaScript Guide - Introduction|url=https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction |datum=2017-05-25|zugriff=2017-07-27}}
Mozilla Developer Network and individual contributors (2017): JavaScript Guide - Introduction, [online] https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction [27.07.2017].</ref>.
Hingegen zu JavaScript ist Swift als eine Allzwecksprache erfunden worden, mit der Absicht die beste, einheitliche Sprache f�r die Systemprogrammierung, zu mobilen Applikationen und Desktop Anwendungen bis hin zum Cloud Service zu bieten. Dabei wurde noch auf drei Punkte sehr gro�er Wert gelegt<ref name="SwiftAbout">{{Internetquelle |autor=Apple Inc |jahr=2017a|titel=About Swift [online]|url=https://swift.org/about/ |datum=ohne Ver�ffentlichunsdatum|zugriff=2017-07-27}} Apple Inc (2017a): About Swift, [online] https://swift.org/about/ [27.07.2017].</ref>:
* Sicherheit: Dabei wird davon ausgegangen, dass nicht definiertes Verhalten der Grund f�r unsichere Programmierung ist. So muss in Swift jedes m�gliche Ende bedacht und definiert werden da sonnst eine Kompiliertungsfehler auftritt.
* Performance: Swift soll alle C-basierten Sprachen ersetzen. Dazu muss Swift vergleichbar in der Abarbeitung verschiedener Aufgaben sein wie diese Sprachen und diese genau so schnell umsetzen k�nnen und gleichzeitig die Ressourcen schonen.
* Ausdruck: Die Syntax<ref name="SwiftLang">{{Internetquelle|autor=Apple Inc|jahr=2017b|titel=Language Guide|url=https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309 |datum=05-06-2017 |zugriff=2017-07-27}} Apple Inc (2017b): Swift - Language Guide, [online] https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309 [27.07.2017].</ref> wurde mit Jahrzehnten von Programmiererfahrung entwickelt und wird auch immer weiter entwickelt werden. 

====Compiling====
JavaScript iste eine dynamische typisierte, prototypenbasierte, interpretierte Programmiersprache, wobei die Betonung auf "interpretierte" liegt. Der Unterschied liegt darin, dass Swift zu den kompilierten Sprachen z�hlt.

''''Interpretierte Sprachen:''''

In dem Moment wo das Programm gestartet wird, wird der Code in Instruktionen �bersetzt und auch ausgef�hrt. Diese �bersetzung �bernimmt ein zus�tzliches Tool, der Interpreter. Dieser l�uft wie eine virtuelle Maschine auf dem PC und nimmt Eingaben sowie den Quellcode und wandelt diesen in einen hardwareunabh�ngigen Bytecode. Dies passiert w�hrend der Laufzeit, wobei pro Prozessor ein Interpreter ben�tigt wird. <br/>
'''Vorteil:''' Leichter bei der Entwicklung, da bereits w�hrend der Entwicklung getestet werden kann. JavaScript wird im Plaintext an den Client �bertragen und kann von anderen Entwicklern gelesen und gelernt werden.<br/>
'''Nachteil:''' Langsamer und ineffizienter als kompilierte Sprachen, da kontrollflusssteuernte Funktionen (Schleifen, Funktionen) immer wieder �bersetzt werden m�ssen. <ref name="ElektronikKompendium">{{Internetquelle |autor=Patrick Schnabel |jahr=2012 |titel=Compiler und Interpreter [online] |url=https://www.elektronik-kompendium.de/sites/com/1705231.htm |datum=2012-11-28 |zugriff=2017-07-27 }} Schnabel, Patrick (2012): Compiler und Interpreter, [online] https://www.elektronik-kompendium.de/sites/com/1705231.htm [27.07.2017].</ref><br/>

''''Kompilierte Sprachen:''''
Der Compiler �bersetz den Quellcode in ein maschinenlesbares Programm, sodass es vom Menschen nicht mehr gelesen werden kann, jedoch sofort ausgef�hrt werden kann. Dieses Programm bzw. die Anweisungen im Programm werden direkt vom Prozessor ausgef�hrt. Jedesmal wenn sich im Programmcode etwas �ndert, muss der gesamte Code neu kompiliert werden.<br/>
'''Vorteil:''' Der Code wird durch den Compiler optimiert. Kompilierte Programme sind sehr schnell in der Ausf�hrung.<br/>
'''Nachteil:''' Der Aufwand bei der Entwicklung ist ist zeitraubender, da das Programm vor einem Testlauf jedesmal neu kompiliert werden muss. <ref name="ElektronikKompendium" /><br/>

===Warum JavaScript mit Node.js als Reverenz===

JavaScript hat mit der immer gr��er werdenden Nachfrage und der schnellen Weiterentwicklung eine sehr interessanten Geschichte. Auch wird es zusehends in der Webentwicklung serverseitig immer �fters eingesetz. Damit kann man neben PHP davon ausgehen, dass JavaScript mit Frameworks wie Node.js eine solide Basis f�r einen Vergleich bietet. Da Swift auch unter anderem die beste Sprache f�r die Webentwicklung werden m�chte, kann somit ein Fazit gezogen werden, in wie weit Swift dieses Ziel bereits erreicht hat und in welchen Bereichen noch Nachholbedarf besteht. 

===Installation des Node.js Servers===

Der Server ist wie bereits bei der Installation des Swift-Servers von Github auszuchecken oder als .zip-Datei herunterzuladen. Nach dem Auschecken oder Entpacken des Projekts, muss mit einem Terminal ins Verzeichnis "NodeServer" gewechselt werden und der Server mit npm initalisiert werden. Dabei werden alle notwendigen Packages heruntergeladen und der Server kann mit node gestartet werden. 

<blockquote>
	<code>cd NodeServer</code><br/>
	<code>npm init</code><br/>
	<code>node index.js</code><br/>
</blockquote>

===Die Server im Vergleich===

Beide Server sind im MVC (Model View Controller) Pattern gehalten und haben folgenden Ablauf:
Der Request wird empfangen und an einen der jeweiligen Handler weitergegeben.
Die Handler geben entweder den Request direkt an eine View-Klasse/Methode oder an eine Model-Klasse/Methode weiter.
Die Model Dateien speichern User-Daten wie Usernamen, Passwort, Vorname, Nachname und E-Mail in einem JSON File. Das Passwort wird bevor es gespeichert wird verschl�sselt.
Die Profile der User werden in beide Servern als eigenen Objekt angelegt und k�nnen als JSON serialisiert werden. Als Sammelverzeichnis wird der Ordner "profiles" angelegt in dem wiederum ein Verzeichnis mit dem Usernamen erstellt. Erst in diesem wird das JSON File gespeichert. Diese Verzeichnisse sind notwenig sollten Bilder oder �hnlichen zu den Usern gespeichert werden.
Als zweites Aufgabengebiet sind in den Model Dateien Methoden und Funktionen enthalten, die diese Daten aus den JSON Files wieder ausliest, und das Passwort z.B. f�r den Login �berpr�fen. 
Sp�testens nachdem die Model-Funktionen fertig sind wird der Request an die View �bergeben. Hier werde die HTMLs zusammengebaut und an den Client zur�ckgeschickt.
Die Funktionalit�t ist f�r Studenten der FH Joanneum gedacht. Die Studenten k�nnen ihre t�ts�chlichen Noten mit dem Usernamen und Passwort der FH-Domain abrufen. 
Die Server unterscheiden sich ausschlie�lich durch Sprach- und Framework spezifischen Vorgaben. Weiter haben wir versucht �hnliche Packages zu verwenden und so wenig Workarounds zu implementieren, die Packages ersetzen.
