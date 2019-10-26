# Docker dev

* `docker build -t dev .`
* `docker run -itd --name dev -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/workdir/:/home/www-data/work -v /path/to/.ssh/:/home/www-data/.ssh dev`
* `docker exec -it dev bash`

## Incluye

* git
* php 7.3
* node 10
    * uglifyjs
    * pm2
* npm 6
* docker y docker compose (se debe instalar en host y crear volumen con docker.sock)