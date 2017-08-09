<!-- General Info on how to setup the server -->
__NOTOC__
== Einleitung ==
Dieser Teil des ''Wikibooks'' zeigt wie ein Linux-Server ([https://www.ubuntu.com/server Ubuntu Server] 16.04 LTS), im konkreten Fall in einer [https://en.wikipedia.org/wiki/Virtual_machine virtuellen Maschine] ([https://www.virtualbox.org/ VirtualBox]), aufgesetzt wird. Dieser Teil richtet sich an unerfahrene Benutzer bzw. um eine einheitliche Ausgangslage mit dem ''Wikibook'' zu schaffen. Sollte ein Server bereits vorhanden sein, kann dieser Teil auch übersprungen werden.
== Vorbereitung ==
=== VirtualBox ===
VirtualBox wird von [https://en.wikipedia.org/wiki/Oracle_Corporation ''Oracle''] zur Verfügung gestellt und erlaubt das [https://de.wikipedia.org/wiki/Virtualisierung_(Informatik) Virtualisieren] eines Betriebssystems. Dieses dient unter anderem als [https://en.wikipedia.org/wiki/Sandbox_(software_development) Sandbox] und bietet eine notwendige Sicherheit gegen Schaden am eigentlichen Betriebssystem.

VirtualBox kann von [https://www.virtualbox.org/wiki/Downloads '' virtualbox.org''] für Windows, Mac und Linux herunter geladen werden.
=== Ubuntu Server ===
Ubuntu Server ist ein leichtgewichtiges Betriebssystem speziell für den Serverbetrieb und [https://en.wikipedia.org/wiki/Ubuntu_(operating_system) Ubuntu] selbst ist eine einsteigerreundliche Linux [https://de.wikipedia.org/wiki/Distribution_(Software) Distribution]. Als Beispiel wurde hier die Version 16.04 [https://en.wikipedia.org/wiki/Long-term_support LTS] gewählt, welche zum derzeitigem Stand (2017) die Aktuellste ist.

Ubuntu Server 16.04 LTS kann von [https://www.ubuntu.com/download/server ''ubuntu.com''] herunter geladen werden.
== Durchführung ==
Nach der Installation von VirtualBox und dem Herunterladen der iso-Datei wird VirtualBox gestartet. Klicke den ''NEW'' Button. Wähle als ''Type'' Linux und als ''Version'' Ubuntu. Ein passender Name für den Server sollte gewählt werden, z.B. "Swift-Server". Folge der Installation, wähle "Memory" im grünen Bereich, für das ''Wikibook'' waren es 1800MB und ca. 8GB festem Speicher. In der linken Box erscheint nun unser Server, welcher durch Doppelklick oder "START" Button gestartet wird. Es erscheint ein Dialog bei dem das zuvor geladene Image (iso-File) ausgewählt wird. Wähle "Install Ubuntu Server", wähle die Sprache und das Keyboard-Layout.  Bei der Wahl des Servernames bietet sich der Name an, der für die VirtualBox gewählt wurde. Nach der Wahl des Benutzernamens und eines Passwortes muss eine Partitionierungsmethode gewählt werden, wie zum Beispiel "Guided - use entire disk and set up LVM". Bei den Werkzeugen sollten Standard System Werkzeuge gewählt werden, wobei auf alle anderen Werkzeuge, wie zum Beispiel die graphische Benutzeroberfläche, verzichtet werden kann. Nachdem die Installation abgeschlossen wurde, sollte das System gestartet und alle nötigen Updates durchgeführt werden. Dafür können die folgenden Befehle verwendet werden:
{{SwiftOnLinux CMD|sudo apt-get update}}
{{SwiftOnLinux CMD|sudo apt-get -y upgrade}}
== Fazit ==
Es steht nun ein leichtgewichtiger Linux Server zu Verfügung, welcher sich ideal für das Arbeiten mit Swift, bzw. der Entwicklung eines Swift basierten Webservers eignet. Weiter zur [[Swift On Linux/Haupteil/Installation von Swift/|Installation von Swift]]
{{SwiftOnLinux Footer}}
