# Portfolio Teil 2

![Bild von DevOps](https://cdn.prod.website-files.com/6344c9cef89d6f2270a38908/6453f14b83b4a36b72707435_7602%201.png)


# Inhaltsverzeichnis

- [1 Test](#1-test)
- [2 Release](#2-release)
- [3 Deploy](#3-deploy)
- [4_Aufteilung der Arbeiten](#4-aufteilung-der-arbeiten)
- [Quellenverzeichnis](#quellenverzeichnis)


# 1 Test
Wie der Name schon sagt werden in dieser Phase unterschiedliche Aspekte getestet.
Der Fokus liegt auf der Qualitätssicherung der Software. Nachfolgend werden die vier Testarten erläutert und eine Vermutung aufgestellt, in welcher Phase welcher Test durchgeführt wird.
## Unit-Test
Ein Unit-Test testet die kleinsten Komponenten der Software, beispielsweise Methoden und Klassen.
Diese können isoliert getestet werden und sind die als erstes durchgeführten Tests, welche unserer Vermutung nach in der Phase "Build" gestartet werden, da bei uns in der Firma dies unter "Maven Build" integriert ist.

## Integrations-Test
Diese prüfen das Zusammenspiel mehrerer Komponenten sowie die Schnittstellen. Wir vermuten, dies wird ebenfalls in der Phase "Build" erledigt, da dies ebenfalls durch den "Maven Build" Befehl durchgeführt wird.

## System-Test
Systemtests testen das Funktionieren einer Lauffähigen Applikation sowie dessen Abhängigkeiten, Datenintegrität und Kommunikation.
Diese Tests werden mutmasslich unter "Test" durchgeführt, da wir nicht wissen, wo dies sonst einordbar wäre.

## Akzeptanz-Test
Dieser Test wird durch den Kunden ausgeführt und überprüft ob die Endnutzer zufrieden mit dem Projekt sind. Hier vermuten wir, dass dieser Test während der Deploy-Phase durchgeführt wird, da in dieser schon alles laufen sollte, aber noch nichts Released wurde

## Überprüfen der Vermutungen
Wir führten folgende Unterhaltung mit ChatGPT o3-mini-high, da diese Version Reasoning beherrscht und sich somit selbst überprüft vor der Finalen Antwort.

Prompt:
> In welcher der acht DevOps Phasen werden welche Testarten (Unit-, Integration-, System- und Akzeptanztest) ausgeführt und wieso? Fasse dich kurz sofern möglich

Reasoning:
> In DevOps werden Tests in den verschiedenen Phasen wie folgt durchgeführt:
> - Unit-Tests: In der Code-/Build-Phase, da sie schnell laufen und die Korrektheit von Einzelkomponenten überprüfen.
> - Integrationstests: In der Test-Phase (oder auch in der Build-Phase bei kontinuierlicher Integration), um die Interaktionen zwischen Modulen zu testen.
> - Systemtests: Ebenfalls in der Test-Phase, um die Gesamtfunktionalität des Systems zu validieren.
> - Akzeptanztests: In der Release- oder Deploy-Phase, um zu prüfen, ob das Produkt die Anforderungen erfüllt.

Antwort:
> In den frühen Phasen – also während des Codings und Builds – werden Unit-Tests durchgeführt, um einzelne Funktionen isoliert zu prüfen. In der Test-Phase laufen Integrationstests, die das Zusammenspiel der Module sicherstellen, sowie Systemtests, die das Verhalten des gesamten Systems validieren. Abschließend, meist in der Release-Phase, erfolgen Akzeptanztests, um zu bestätigen, dass die Software die Anforderungen der Anwender erfüllt. Diese Aufteilung ermöglicht es, Fehler früh zu erkennen und den gesamten Entwicklungszyklus effizient abzusichern.

### Überprüfung der gelieferten Informationen
In der heutigen Zeit ist es ziemlich Schwierig, mit Google gescheite Informationen zu Finden. Am besten Erklärt hatt der folgende Artikel: https://www.nagler-company.com/de/unternehmen/aktuelles/artikel-anzeigen/automatisiertes-testen-im-devops-umfeld.html
Dieser schreibt, dass Unit-Tests in der Build-Phase, Integrations-Tests sowie System-Tests in der Test-Phase, und die Akzeptanztests in der Deploy-Phase durchgeführt werden. Weiter überprüfen konnte ich diesen Artikel jedoch nicht, da die referenzierten Artikel nicht mehr existieren.
Willkommen in der Google suche 2025...

## Tools

Für die Auswahl der Tools entschieden wir uns, mal das erste Google Ergebnis als Anhaltspunkt zu nehmen, und einige darin empfohlene Tools zu analysieren.
Wir stossen auf die Webseite Browserstack.

Folgende empfohlene Tools fanden wir auf den ersten Blick ansprechend.

Mocha
Dieses Tool schied leider nach kurzer Recherche aus, da es nur für Node JS geeignet ist. Interessante Wahl für einen Artikel über JS Test Frameworks.
Ebenfalls stellten wir bei der Recherche zu Karma fest, das Mocha mit Karma läuft.

Jasmine
Jasmine ist ein Tool, welches drei Installationsavarianten bietet. Standalone, im Browser oder über NodeJS. Ebenfalls ist das Tool ein Open Source Projekt.

Karma
Karma, ehemals Testacular, ist sehr weit verbreitet. Laut angaben haben sie ihr Projekt in Mocha sowie IntelliJ, und in einem Google-Beitrag wird von diesem Tool regelrecht geschwärmt.
Auch dieses Tool ist Open Source.

Quellen: https://jasmine.github.io/pages/getting_started.html
https://karma-runner.github.io/latest/index.html
https://testing.googleblog.com/2012/11/testacular-spectacular-test-runner-for.html
https://www.browserstack.com/guide/top-javascript-testing-frameworks

## Umsetzung

Das bereits erläuterte Programm erweitern wir jetzt um ein Paar test mithilfe von Jasmine.
Mein Javascript Test file liess ich von ChatGPT generieren, da ich nicht die nötigen Kenntnisse habe, um dies selbst zu erledigen.

Er kam zu folgendem Ergebnis:
```javascript
describe('Task Manager', function() {
    let taskInput, descInput, taskList;

    beforeEach(function() {
        // Set up the DOM for testing
        document.body.innerHTML = `
            <input id="taskInput" />
            <input id="descInput" />
            <ul id="taskList"></ul>
        `;
        
        // Get elements
        taskInput = document.getElementById('taskInput');
        descInput = document.getElementById('descInput');
        taskList = document.getElementById('taskList');
    });

    describe('addTask()', function() {
        it('should add a task to the list when valid inputs are provided', function() {
            taskInput.value = 'New Task';
            descInput.value = 'Task description';

            addTask(); // Call the function to test

            const taskItems = taskList.getElementsByTagName('li');
            expect(taskItems.length).toBe(1); // One task added
            expect(taskItems[0].querySelector('span').textContent).toBe('New Task');
            expect(taskItems[0].querySelector('.description').textContent).toBe('Task description');
        });

        it('should clear the inputs after adding a task', function() {
            taskInput.value = 'New Task';
            descInput.value = 'Task description';

            addTask();

            expect(taskInput.value).toBe('');
            expect(descInput.value).toBe('');
        });

        it('should not add a task if the task input is empty', function() {
            taskInput.value = '';
            descInput.value = 'Task description';

            addTask();

            expect(taskList.getElementsByTagName('li').length).toBe(0); // No tasks added
        });
    });

    describe('removeTask()', function() {
        it('should remove a task when the delete button is clicked', function() {
            taskInput.value = 'Task to Remove';
            descInput.value = 'Description to remove';
            addTask(); // Add task

            const deleteButton = taskList.querySelector('.delete');
            deleteButton.click();

            expect(taskList.getElementsByTagName('li').length).toBe(0); // Task removed
        });
    });

    describe('toggleDescription()', function() {
        it('should toggle the visibility of the task description when clicked', function() {
            taskInput.value = 'Task with Description';
            descInput.value = 'Description content';
            addTask(); // Add task

            const taskHeader = taskList.querySelector('.task-header');
            const description = taskList.querySelector('.description');

            // Initially, description should be hidden
            expect(description.style.display).toBe('');

            // Click to toggle visibility
            taskHeader.click();
            expect(description.style.display).toBe('block'); // Description visible

            // Click again to toggle back
            taskHeader.click();
            expect(description.style.display).toBe(''); // Description hidden
        });
    });
});

```

Integriert ins HTML wird das Ganze folgendermassen:
```html
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jasmine/3.6.0/jasmine.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jasmine/3.6.0/jasmine-html.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jasmine/3.6.0/boot.min.js"></script>
    <script src="test.js"></script>
```

Dies führte zu einem komischen Ergebnis
![Bild2 von Azure](https://i.imgur.com/tUae828.jpeg)
Auch lieferte dies keinen Error in der Konsole, und da ich wie bereits erwähnt nicht sonderlich versiert bin mit Javascript, komme ich an diesem Punkt nicht mehr weiter.

## Reflexion
Das arbeiten mit dem Gewählten Tool hat für mich so gar nicht funktioniert. Ich hätte mir bessere Rückmeldungen zur Fehlersuche gewünscht, denn ohne diese bin ich aufgeschmissen. Ich denke, wenn man sich in der Thematik besser auskennt, wäre dies weniger ein Problem. Nichtsdestotrotz war es spannend, mal etwas anderes auszuprobieren, auch wenn es schlussendlich nicht funktionierte.

# 2 Release

Für diesen Teil setzten wir wie Folgt einen Docker Container auf.

## Applikation
Den Prozess führen wir mit der Applikation aus Portfolio Teil 1 fort. 
//CODE

## Docker Image

```Dockerfile
# Angabe des Base-Image, in unserem Fall Linux Alpine
FROM httpd:alpine

# Kopieren der relevanten Dateien ins Apache-Verzeichnis
COPY index.html /usr/local/apache2/htdocs/index.html

# Exponiere Port 80
EXPOSE 80 
```

## Docker Compose

Diese Datei dient dazu, das Image zu verwalten.

```yaml
version: "3.8"

services:
  web:
# Suche und baue das Dockerfile
    build: .
    container_name: todo-list
    ports:
      - "8080:80"
    volumes:
      - .:/usr/local/apache2/htdocs/
    restart: always
```
Zu beachten ist, dass das index.html, Dockerfile und docker-compose.yml im gleichen Verzeichnis sind, sonst funktioniert die obigen Konfigurationen nicht.

Wenn man das docker-compose.yml mit folgendem Command ausführt: 
```bash
docker compose -f docker-compose.yml up -d
```

Dann ist die Applikation lokal unter folgenden Link abrufbar: http://localhost:8080/index.html

## Verwendete Apps/Tools
Wenn man das Wort Container nur schon hört, denkt man an Docker. Ohne Docker wäre die Aufgabe wahrscheinlich schon lösbar, aber viel schwieriger, weswegen wir uns auch für Docker entschieden haben.
Als Base Image haben wir uns für Apache httpd:alpine entschieden. Einfach aus dem Grund, weil es ein sehr schlankes und einfaches Image ist, wo man wenig konfiguration benötigt um ans Ziel zu kommen.
Somit mussten wir nur ein dreizeiliges Dockerfile und ein kurzes Docker Compose schreiben und schon konnten wir die Applikation als Container zur Verfügung stellen. 

## Erfahrungen mit den gewählten Tools
Cyrill hatte schon einige Erfahrungen mit Docker auch von der betrieblichen Seite aus, Larissa hatte nur Vorkenntnisse, welche den Unterrichtsstoff umfassen. Trotzdem konnten beide relativ schnell diese beiden Files zusammenstellen.
Ohne Vorkenntnisse wäre dies natürlich nicht so einfach, aber man sieht hier, dass man wirklich nicht viel Vorkenntnisse benötigt um hier ein Image erstellen zu können. Mit docker compose hat man auch uns unserer Sicht einen relativ intuitiven Weg das Image automatisiert laufen lassen zu können
ohne immer wieder die Commands, in die Shell, eingeben zu müssen. Die einzige Voraussetzung ist, dass man die Yaml Syntax verstehen muss, was jetzt aus unserer Sicht nicht die Welt ist. 


## Reflexion
Wenn man jetzt die Applikation wirklich produktiv auf einem System deployen wollen würde, müsste man natürlich noch vor allem Sicherheitsthemen und andere Dinge berücksichtigen. Diese Dinge haben wir jetzt in diesem Auftrag ein wenig aussem vor gelassen
um die Komplexität nicht unnötig zu erhöhen. Beim einem anderen Mal, wo wir vor allem mehr Zeit hätten, würden wir uns auch mehr Zeit nehmen, es mit richtigen Sicherheitsvorgaben und ähnlichem Umzusetzen und Lauffähig zu machen. Man könnte jetzt das Releasen 
und bauen dieses Images und Container noch mit in die Github Action integrieren und den ganzen Prozess automatisieren.



## Alternative Tools

Es gibt diverse Alternativen zu Docker. Wir haben uns Hyper-V Container kurz angesehen, realisierten jedoch in Kürze dass diese Variante für uns nicht passt.
Hyper-V Container sind in erster Linie nur auf Windows verfügbar (Cyrill verwendet MacOs) und hat standalone nur Windows Images. Viele andere Alternativen, z.B. Kubernetes sind schlussendlich von Docker abhängig, weshalb wir auf diese nicht genauer eingehen

Quelle: https://www.it-visions.de/%7B3D420996-D223-43CB-84CD-04341518483A%7D.aspx



# 3 Deploy

Da wir keinen Zugriff auf das AWS lerner Lab hatten, haben wir uns dazu entschieden die Applikation auf Azure zu deployen. 
Es war eine Tortur bis wir endlich mal einen Account hatten, welcher auch Student Credits drauf hatte. Insgesamt mussten wir ungelogen und 10000x einloggen
und 400x bestätigen, dass wir auch wirklich Schüler sind und 2 Jahre unserer Lebenszeit aufwenden, bis wir die 100 USD auf unserem Account hatten. 

Danach war aber das Deployment sehr einfach. Wir erstellten eine Static WebApp und verknüpften diese mit unserem GitHub Repository, worauf es uns automatisch einen GitHub Workflow erstellte
welcher automatisch die Applikation dann deployt, wenn eine neue Version auf dem Main Branch commited/gepushed wird. 

![Bild1 von Azure](https://i.imgur.com/FHFeXjw.jpeg)
![Bild2 von Azure](https://i.imgur.com/ff6Wk9R.jpeg)

Wichtig ist, dass man bei den Build Options HTML angibt und da unsere Applikation in diesem Fall auf dem root Verzeichnis liegt, auch das root Verzeichnis angibt.
Danach muss man noch erstellen klicken und dann wird nach 1-2 Minuten die Applikation deployt und alles läuft wie geschmiert. 
Die Applikation ist unter folgenden Link verfügbar [TodoListApp](https://calm-moss-03f0e8d10.6.azurestaticapps.net/)
## Verwendete Apps/Tools
Wir haben Azure Verwendet. 
Wir haben mal ChatGPT gefragt, was die Vorteile von Azure sind:
![ChatGPT Prompt zu den Vor/Nachteilen von MS Azure](https://i.imgur.com/ejtCBwK.jpeg)
*ChatGPT Modell 4o 12.03.2025*

Man sieht sehr schnell. Azure ist sehr mächtig, vor allem da es ins Microsoft Ökosystem eingegliedert ist. Auf der anderen Seite ist es aber auch sehr riesig, was vor allem neue User überfordern kann.
Ausserdem ist die ganze Cloud geschichte nicht besonders billig wie wir vorhin gesehen haben, ist es relativ mühsam bis man Student Credits bekommt.


## Erfahrungen mit den gewählten Tools
Wir beide haben nur sehr wenige Erfahrungen, welche über einen ÜK nicht hinausgehen und würden den Erfahrungsbericht gerne in 2 Teile unterteilen. 
Bis man endlich Student Credits bekommt braucht man wirklich Geduld und es wird einem extrem viele Steine in den Weg gelegt bis man sie endlich bekommt.
Das würden wir von der User Experience als absolut ungenügend beurteilen.
Wenn man aber das endlich geschafft hat, war es wirklich eine Sache von 2 Minuten bis man die Applikation deployt hat. Da Azure im MS Ökosystem integriert ist, kann man es auch wirklich einfach mit GitHub verknüpfen.
Klar wir haben eine sehr einfache App und wenn sie ein wenig komplexer ist, braucht man vielleicht ein wenig mehr Zeit, aber wir waren sehr überrascht wie einfach es doch am Ende ging.




## Reflexion
Wir haben wirklich gefühlte 2 Jahre Lebenszeit verloren bis wir mal endlich diese Studentcredits bekommen haben. 
Aber danach ging alles wie vom Schnürchen von statten. Formular ausfüllen bezüglich der Static Web App, ein wenig den Kopf einschalten bei den 
Konfigurationen und schon war die App deployt. Beim nächsten Mal würde wir vielleicht ein wenig früher nach Hilfe bezüglich den Student Credits suchen anstatt uns selbst vor dem Bildschirm verrückt zu machen.

## Alternative Tools
Wie schon oben erwähnt gibt es das Pendant von Amazon, nämlich Amazon Web Services (AWS). Inzwischen haben aber auch Unternehmen wie Google, Oracle und Nord ein Cloud Computing Dienst.
Grundsätzlich funktionieren die sehr ähnlich und bieten auch unterschiedliche Funktionen. Sie unterscheiden sich meist durch Serverstandorte und Privacy Policy unterschieden. Am Ende bleiben aber alle am Ende Schweineteuer. 

# 4 Aufteilung der Arbeiten
| Kapitel           | Larissa                                                            | Cyrill                                                                           |
|-------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Test              | Formulieren des Textes                                             | Recherche von Larissa überprüft                                                  |
| Release           | Schreiben der Docker Files + Dokumentation mit mehr Fokus auf Doku | Schreiben der Docker Files + Dokumentation mit vermehrten Fokus auf Docker Files |
| Deploy            | Formulieren der Texte im Portfolio                                 | Aufsetzen der Static Web App                                                     |
| Sonstige Arbeiten | Rechtschreibscheck durchführen mit ChatGPT                         | Aufsetzen des Markdowns mit Inhaltsverzeichnis und Quellenverzeichnis            |


# Quellenverzeichnis
- It-Visions.ch, Dr. Holger Schwichtenberg, Was ist ein Hyper-V-Container, o.D.,https://www.it-visions.de/%7B3D420996-D223-43CB-84CD-04341518483A%7D.aspx
- Nagler & Company, Thomas Weisshaar, Automatisiertes Testen im DevOps Umfeld, 1.12.2022, https://www.nagler-company.com/de/unternehmen/aktuelles/artikel-anzeigen/automatisiertes-testen-im-devops-umfeld.html
-  https://jasmine.github.io/pages/getting_started.html
- https://karma-runner.github.io/latest/index.html
- https://testing.googleblog.com/2012/11/testacular-spectacular-test-runner-for.html
- https://www.browserstack.com/guide/top-javascript-testing-frameworks
## Bildquellen
- **Titelbild:** Geekflare, die 6 besten Tools zur Konfigurationsverwaltung in DevOps, 22.01.2025, https://geekflare.com/de/config-management-tools/

## KI Verzeichnis
- ChatGPT Modell 4o, 12.03.2025, ![ChatGPT Prompt zu den Vor/Nachteilen von MS Azure](https://i.imgur.com/ejtCBwK.jpeg)
- 
