MAKEFLAGS += --silent

DOCKER_REPO="movoin/devops-php7"

all: php

publish: push

#
# image: movoin/devops-php7
#
php:
	bash build.sh "${DOCKER_REPO}"

test:
	docker run -it --rm ${DOCKER_REPO}

run:
	docker run -it --rm ${DOCKER_REPO} bash

push:
	docker push ${DOCKER_REPO}
