# M324Portfolio

# Inhaltsverzeichnis

- [Ausgangslage](#ausgangslage)
- [Versionsverwaltung](#versionsverwaltung)
- [Planung](#planung)
- [Code](#code)
- [Build](#build)

# Ausgangslage
Wir haben uns von ChatGPT eine kleine ToDo Liste App, welche nur aus einem HTML File besteht, aber trotzdem die Basisfunktionen besitzt. 
Man hat ein Eingabefeld, wo man Todo's eingeben kann und am unteren Ende wird dann dieses Todo eingefügt. Man kann das ToDo wieder löschen sobald man es erledigt hat.
Logischerweise ist diese App noch ausbaufähig und deswegen wollen wir das Design überarbeiten. Nämlich stimmen noch einige grössen der Buttons noch nicht und die App ist auch nicht
auf dem Handy gut nutzbar. Deswegen wollen wir einen Sprint machen, wo wir genau diese Issue tackeln. 


# Versionsverwaltung

Man nutzt Versionsverwaltungen um Codestände zu speichern und auf keinen Fall den Code zu verlieren. Falls mal jemand ein Feature einbaut
welches die ganze Applikation lahm legt, kann man relativ schnell und einfach wieder auf einen älteren funktionalen Stand zurückgehen.
Der Branchenstandard für Versionsverwaltungen ist Git.



# Planung


## Kurzbeschreibung der verwendeten Apps/Tools:
Trello ist ebenfalls ein Tool von Atlassian, welches jedoch neben den kostenpflichtigen Varianten eine kostenlose anbietet. Diese beinhaltet wie die kostenpflichtige Variante Automatisierung und Boards, ist jedoch nur für Teams bis zu zehn Personen nutzbar und hat nicht alle Ansichten, die die premium Version bietet.
## Begründung der Wahl dieser Tools:
Wir haben uns für Trello entschieden, da das Tool relativ übersichtlich und schlank aussieht. Uns hat interessiert ob so ein schlankes Tool die nötigen Anforderungen erfüllen kann.
Wir hatten noch Klipfolio und Confluence im Auge aber entweder haben die Tools keine kostenfreie Version oder wir verwenden die Tools bereits in unseren Betrieb. 

## Erfahrungen mit den gewählten Tools:
Wir haben eine positive Erfahrung mit Trello gemacht. Es ist ein Tool welches relativ schlank ist aber genug an Features bietet. Aus unserer Sicht es perfekt geeignet für den persönlichen Gebrauch 
oder in kleinen Teams. Für grosse Teams hat es ein wenig zu wenig Features bzw. wird dann mit der Zeit ein wenig zu unübersichtlich. 
Das generelle Feeling und arbeiten mit dem Tool war sehr angenehm und intuitiv. Wir konnten sehr schnell ein Board erstellen und auch darauf Items platzieren und diese dann auch herumschieben. Wir fanden vor allem das Feature dass man Items Zeitlich begrenzen kann und sie dann auch in einer Kalenderansicht anschauen kann. 
So kann man schnell ansehen welche Items wann fällig sind. 
## Reflexion:
Die generellen Grundfunktionen laufen in diesem Tool einwandfrei. Die Bedienung des Boards ist einfach und funktioniert einwandfrei. Es fehlt uns aber ein wenig an zusätzlichen Funktionen. Z. B. kann man nicht richtig in Sprints und nach allgemeinen Scrum Prinzipien arbeiten. Diese Dinge müsste man separat managen. Ausserdem kann man 
auch nicht richtig die Ressourcen managen bzw. Grafiken wie Burn Down Charts etc. generieren lassen. 
Unsere Erkenntnis ist, dass Trello für kleine Teams gut einsetzbar ist wo 3-5 Leute miteinander arbeiten. Sobald aber dann noch Product Owner von aussen und viele Stakeholder dazukommen wird das Tool sehr schnell unübersichtlich und wir denken dass dann ein Jira besser geeignet wäre.
Wir sehen aber auch das Potenzial Trello als persönliches Aufgabentracking, sei es Privat oder Geschäftlich, hat. Man kann sehr schnell und einfach dort seine Aufgaben erfassen und einen Überblick zu behalten. Mit der Kalenderfunktion kann man es noch Zeitlich begrenzen. 
## Alternative Tools:
Jira: Branchenstandard und hat eine Gratisversion. Da es aber so populär ist, wollten wir etwas anderes ausprobieren um unseren Horizont zu erweitern.
Azure DevOps: Auch relativ weit verbreitet und Cyrill kennt bereits das Tool weswegen wir uns dagegen entschieden haben, da wir beide ein neues Tool kennenlernen wollten. 
Monday.com: Hat ebenfalls eine kostenlose Version, aber da uns die Werbung von ihnen früher auf die nerven ging und Trello den lustigeren Namen hatte, haben wir uns gegen Monday entschieden. 
## Nachweise:

![Bild von Trello Bord](./images/Trello_Board.jpg)

# Code

## Semantic Versioning
Unter semantic Versioning (kurz SemVer) versteht man die Versionierung mittels
Major.Minor.Patch (z.B. 1.2.0).
Was diese Begriffe bedeuten findet man auf semver.org:
MAJOR wird erhöht, wenn API-inkompatible Änderungen veröffentlicht werden
MINOR wird erhöht, wenn neue Funktionalitäten, die kompatibel zur bisherigen API sind, veröffentlicht werden,
PATCH wird erhöht, wenn die Änderungen ausschließlich API-kompatible Bugfixes umfassen.

## Conventional Commits
Conventional Commits sind ein Leitfaden, um verständliche und einheitliche Commit Messages zu schreiben.
Der empfohlene Aufbau ist wie folgt:

```
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
```


Es gibt zwei Typen, Fix, welcher einen Bug fixed und im Bezug auf SemVer den Patch erhöht
und Feat, also kurz für Feature, was einen Minor change darstellt.
Andere empfohlene Typen sind build:, chore:, ci:, docs:, style:, refactor:, perf:, test:


# Build
## Kurzbeschreibung der verwendeten Apps/Tools:
Wir haben für die Phase Build
## Begründung der Wahl dieser Tools:

## Erfahrungen mit den gewählten Tools:
## Reflexion:
## Alternative Tools:
## Nachweise:






