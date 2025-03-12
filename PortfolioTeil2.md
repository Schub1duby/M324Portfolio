# Inhaltsverzeichnis

- [1 Test](#1-test)
- [2 Release](#2-release)
- [3 Deploy](#3-deploy)
- [4_Aufteilung der Arbeiten](#4-aufteilung-der-arbeiten)
- [Quellenverzeichnis](#quellenverzeichnis)


# 1 Test

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
ohne immer wieder die Commands, in die Shell, eingeben zu müssen. Die einzige Vorraussetzung ist, dass man die Yaml Syntax verstehen muss, was jetzt aus unserer Sicht nicht die Welt ist. 


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
Die Applikation ist unter folgenden Link Verfügbar [TodoListApp](https://calm-moss-03f0e8d10.6.azurestaticapps.net/)
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
Cyrill: Ich habe wirklich gefühlte 2 Jahre Lebenszeit verloren bis ich mal endlich diese Studentcredits bekommen habe. 
Aber danach ging alles wie vom Schnürchen von statten. Formular ausfüllen bezüglich der Static Web App, ein wenig den Kopf einschalten bei den 
Konfigurationen und schon war die App deployt. Beim nächsten Mal würde ich vielleicht ein wenig früher mir Hilfe bezüglich den Student Credits suchen anstatt mich selbst vor dem Bildschirm verrückt zu machen.

## Alternative Tools
Wie schon oben erwähnt gibt es das Pendant von Amazon, nämlich Amazon Web Services (AWS). Inzwischen haben aber auch Unternehmen wie Google, Oracle und Nord ein Cloud Computing Dienst.
Grundsätzlich funktionieren die sehr ähnlich und bieten auch unterschiedliche Funktionen. Sie unterscheiden sich meist durch Serverstandorte und Privacy Policy unterschieden. Am Ende bleiben aber alle am Ende Schweineteuer. 

# 4 Aufteilung der Arbeiten
| Kapitel           | Larissa                                                            | Cyrill                                                                           |
|-------------------|--------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Test              | Formulieren des Textes                                             | Bereitstellung des Codes mithilfe von ChatGPT                                    |
| Release           | Schreiben der Docker Files + Dokumentation mit mehr Fokus auf Doku | Schreiben der Docker Files + Dokumentation mit vermehrten Fokus auf Docker Files |
| Deploy            | Formulieren der Texte im Portfolio                                 | Aufsetzen der Static Web App                                                     |
| Sonstige Arbeiten | Rechtschreibecheck durchführen mit ChatGPT                         | Aufsetzen des Markdowns mit Inhaltsverzeichnis und Quellenverzeichnis            |


# Quellenverzeichnis
- https://www.it-visions.de/%7B3D420996-D223-43CB-84CD-04341518483A%7D.aspx