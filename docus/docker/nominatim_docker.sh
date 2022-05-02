#! /bin/sh
docker run -d -it --rm --shm-size=1g \
  -e PBF_URL=https://download.geofabrik.de/europe/france/ile-de-france-latest.osm.pbf \
  -e REPLICATION_URL=https://download.geofabrik.de/europe/france/ile-de-france-updates/ \
  -e IMPORT_WIKIPEDIA=false \
  -e NOMINATIM_PASSWORD=very_secure_password \
  -v nominatim-data:/var/lib/postgresql/12/main \
  -p 8080:8080 \
  --name nominatim \
  mediagis/nominatim:4.0      
