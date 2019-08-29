# Docker dev

* Colocar ssh keys en el directorio `keys`
* `docker build -t docker-dev .`
* `docker run -itd --name docker-dev -v //var/run/docker.sock:/var/run/docker.sock -v /path/to/host/workdir:/work docker-dev`
* `docker exec -it docker-dev bash`

## Incluye

* git
* php 7.1.29
* node 10.16.0 
    * uglifyjs
    * pm2
* npm 6.9.0
* docker y docker compose (se debe instalar en host y crear volumen con docker.sock)