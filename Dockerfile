FROM httpd:alpine

# Kopiere nur relevante Dateien ins Apache-Verzeichnis
COPY index.html /usr/local/apache2/htdocs/index.html

# Exponiere Port 80
EXPOSE 80