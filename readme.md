# Docker dev

> Docker in docker image for development

* `docker build -t docker-dev .`
* `docker run -itd --name docker-dev -v //var/run/docker.sock:/var/run/docker.sock -v /path/to/host/workdir:/work docker-dev`
* `docker exec -it docker-dev bash`