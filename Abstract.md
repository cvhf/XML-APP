# Abstract

Im Rahmen der Vorlesung XML-Technologien (Web Data and Interoperability) gehalten von Herrn Marko Harasic haben wir unter
Verwendung eines Coding Davinci Datensatzes eine Web-Anwendung erstellt.
<br> Unsere Projektidee war es einzelne Portraits des 17. und 18. Jahrhunderts aus der Portraitstichsammlung 
der Universitätsbibliothek Leipzig im Web darzustellen und dem Anwender die Möglichkeit zu geben,
diese anhand der Frisur und des Bartes zu bewerten. Über einen einfachen Algorithmus wird dann bestimmt in welchem Jahr der Nutzer
anhand seines Bart- und Frisurengeschmacks am besten aufgehoben wäre.<br>Unter Verwendung eines XML-Schemas und mit Hilfe von XSLT
wurde der Datensatz reduziert und die Portraits von www.flickr.com gecrawlt. Zu jedem Portrait wird außerdem der Name und 
das Geburts- und das Sterbedatum über XPath aus der XML-Datei gezogen und im Browser angezeigt.
Darüber hinaus werden mit SPARQL weitere wichtige Informationen für den
Bartliebhaber aus der DBPedia abgefragt und angezeigt. Unter Verwendung von Microformats wurden mit HCards die Kontaktdaten angelegt
und über die Hilfe werden dem Nutzer über die REST-API von DUCKDUCKGO weitere Informationen über Bärte dargestellt.
<br>


GitHubLink: https://github.com/cvhf/XML-APP
