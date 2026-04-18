# On part d'une image Python de base
FROM python:3.9-slim

# On définit où on travaille dans le conteneur
WORKDIR /app

# On installe Flask (la bibliothèque pour ton API)
RUN pip install flask

# On copie ton fichier app.py dans le conteneur
COPY app.py .

# On dit que l'appli écoute sur le port 5000
EXPOSE 5000

# On lance l'application
CMD ["python", "app.py"]