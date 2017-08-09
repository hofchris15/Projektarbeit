<!-- General Info on how to setup the server -->
__NOTOC__
== Einleitung ==
Dieser Teil des ''Wikibooks'' zeigt wie ein Linux-Server ([https://www.ubuntu.com/server Ubuntu Server] 16.04 LTS), im konkreten Fall in einer [https://en.wikipedia.org/wiki/Virtual_machine virtuellen Maschine] ([https://www.virtualbox.org/ VirtualBox]), aufgesetzt wird. Dieser Teil richtet sich an unerfahrene Benutzer bzw. um eine einheitliche Ausgangslage mit dem ''Wikibook'' zu schaffen. Sollte ein Server bereits vorhanden sein, kann dieser Teil auch �bersprungen werden.
== Vorbereitung ==
=== VirtualBox ===
VirtualBox wird von [https://en.wikipedia.org/wiki/Oracle_Corporation ''Oracle''] zur Verf�gung gestellt und erlaubt das [https://de.wikipedia.org/wiki/Virtualisierung_(Informatik) Virtualisieren] eines Betriebssystems. Dieses dient unter anderem als [https://en.wikipedia.org/wiki/Sandbox_(software_development) Sandbox] und bietet eine notwendige Sicherheit gegen Schaden am eigentlichen Betriebssystem.

VirtualBox kann von [https://www.virtualbox.org/wiki/Downloads '' virtualbox.org''] f�r Windows, Mac und Linux herunter geladen werden.
=== Ubuntu Server ===
Ubuntu Server ist ein leichtgewichtiges Betriebssystem speziell f�r den Serverbetrieb und [https://en.wikipedia.org/wiki/Ubuntu_(operating_system) Ubuntu] selbst ist eine einsteigerreundliche Linux [https://de.wikipedia.org/wiki/Distribution_(Software) Distribution]. Als Beispiel wurde hier die Version 16.04 [https://en.wikipedia.org/wiki/Long-term_support LTS] gew�hlt, welche zum derzeitigem Stand (2017) die Aktuellste ist.

Ubuntu Server 16.04 LTS kann von [https://www.ubuntu.com/download/server ''ubuntu.com''] herunter geladen werden.
== Durchf�hrung ==
Nach der Installation von VirtualBox und dem Herunterladen der iso-Datei wird VirtualBox gestartet. Klicke den ''NEW'' Button. W�hle als ''Type'' Linux und als ''Version'' Ubuntu. Ein passender Name f�r den Server sollte gew�hlt werden, z.B. "Swift-Server". Folge der Installation, w�hle "Memory" im gr�nen Bereich, f�r das ''Wikibook'' waren es 1800MB und ca. 8GB festem Speicher. In der linken Box erscheint nun unser Server, welcher durch Doppelklick oder "START" Button gestartet wird. Es erscheint ein Dialog bei dem das zuvor geladene Image (iso-File) ausgew�hlt wird. W�hle "Install Ubuntu Server", w�hle die Sprache und das Keyboard-Layout.  Bei der Wahl des Servernames bietet sich der Name an, der f�r die VirtualBox gew�hlt wurde. Nach der Wahl des Benutzernamens und eines Passwortes muss eine Partitionierungsmethode gew�hlt werden, wie zum Beispiel "Guided - use entire disk and set up LVM". Bei den Werkzeugen sollten Standard System Werkzeuge gew�hlt werden, wobei auf alle anderen Werkzeuge, wie zum Beispiel die graphische Benutzeroberfl�che, verzichtet werden kann. Nachdem die Installation abgeschlossen wurde, sollte das System gestartet und alle n�tigen Updates durchgef�hrt werden. Daf�r k�nnen die folgenden Befehle verwendet werden:
{{SwiftOnLinux CMD|sudo apt-get update}}
{{SwiftOnLinux CMD|sudo apt-get -y upgrade}}
== Fazit ==
Es steht nun ein leichtgewichtiger Linux Server zu Verf�gung, welcher sich ideal f�r das Arbeiten mit Swift, bzw. der Entwicklung eines Swift basierten Webservers eignet. Weiter zur [[Swift On Linux/Haupteil/Installation von Swift/|Installation von Swift]]
{{SwiftOnLinux Footer}}
