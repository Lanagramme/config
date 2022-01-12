**Basic docker file**

``` Dockerfile

FORM node:12.16.3

WORKDIR /code

ENV PORT 80

COPY package.json /code/package?json

RUN npm install 

COPY . /code

CMD ["node", "src/server.js"]

```

*Description :*
From : indique le container docker utilisé comme base 
WORKDIR : directory utilisé
ENV : variables d'environnement
COPY : copier des fichiers locaux dant le container. le premier argument est le directory local et le second le directory à l'interieur du container
CMD : suite des commandes lancées au démarrage du container

**Build un container**
Build a docker container tagged hello_world using the Dockerfile present in the current directory

```bash
docker build --tag hello-world . 
```

*List all docker images*
docker images

*run images*
docker run hello-world

*list running docker processes running*
docker ps -a

*start a running docker container*
docker start

*stop a running container*
docker stop

run a container from the image => image_name,
call it contaner_name
map the local port 8080 to the port 80 of the container,
run it in dettached mode
docker run -p 8080:80 --name container_name -d image_name

*show logs*
Show in real time the logs for the container hello_world
docker logs -f hello_world


