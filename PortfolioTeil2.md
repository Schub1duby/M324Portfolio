# Inhaltsverzeichnis

- [1 Test](#1-test)
- [2 Release](#2-release)
- [3 Deploy](#3-deploy)
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



# Quellenverzeichnis
- https://www.it-visions.de/%7B3D420996-D223-43CB-84CD-04341518483A%7D.aspx