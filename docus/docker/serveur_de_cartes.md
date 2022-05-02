## Installation du serveur de navigation OSRM

**Téléchager les cartes OpenStreetMap depuis le site geofabrik.de**

```bash
# Paris
wget http://download.geofabrik.de/europe/germany/*region*.osm.pbf 
# Ile de france
wget http://download.geofabrik.de/europe/germany/*region*.osm.pbf 
```

**Préprocessus des cartes**

Dans les oppérations suivantes, remplacer *region* par le nom exact du fichier pbf de la région trouvé sur le site geofabrik.de

```bash
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-extract -p /opt/car.lua /data/*region*.osm.pbf
```
L'option -v "${PWD}:/data" crée le dossier /data dans le container et et le lie au pwn(le dossier chargé dans le terminal au moment ou la commande est lancée). Le fichier /data/*region*.osm.pbf à l'intérieur du container fait référence au fichier du même nom dans le pwd.

```bash
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-partition /data/*region*.osrm
docker run -t -v "${PWD}:/data" osrm/osrm-backend osrm-customize /data/*region*.osrm
```

**Lancer le container**

```bash
docker run -d -t -i -p 5000:5000 -v "${PWD}:/data" osrm/osrm-backend osrm-routed --algorithm mld /data/berlin-latest.osrm
```
L'initialisation du serveur peut prendre quelques minutes à s'éffectuer au premier démmarage

*Test du serveur*

```bash
curl "http://127.0.0.1:5000/route/v1/driving/13.388860,52.517037;13.385983,52.496891?steps=true"
```

*Optionnel* **Insaller un frontend pour le serveur**

```bash
docker run -p 9966:9966 osrm/osrm-frontend
```

*Test du serveur frontend*

```bash
xdg-open 'http://127.0.0.1:9966'
```

Si Docker se plaint de ne pas être capable e se connecter au deamon docker, assurez vous que l'utilisateur connecté soit membre du groupe docker

```bash
sudo usermod -aG docker $USER
```
Redémarez le terminal pour que le changement de groupe prennent effet

## Instllation du serveur d'aresses Nominatim

Lancer la commande suivante :

```bash
docker run -d -it --rm --shm-size=1g \
  -e PBF_URL=https://download.geofabrik.de/europe/france/ile-de-france-latest.osm.pbf \
  -e REPLICATION_URL=https://download.geofabrik.de/europe/france/ile-de-france-updates/ \
  -e IMPORT_WIKIPEDIA=false \
  -e NOMINATIM_PASSWORD=very_secure_password \
  -v nominatim-data:/var/lib/postgresql/12/main \
  -p 8080:8080 \
  --name nominatim \
  mediagis/nominatim:4.0      
```

ou exécutez le script nomnatim_docker.sh pour lancer le serveur sur le port 8080

*Tester le server*

