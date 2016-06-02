#!/bin/sh

DOCKER_VERSION=$(curl -s -XHEAD -I https://github.com/docker/docker/releases/latest | egrep '^Location' | sed 's/\r//' | egrep -o '[0-9]+.[0-9]+.[0-9]+$')
COMPOSE_VERSION=$(curl -s -XHEAD -I https://github.com/docker/compose/releases/latest | egrep '^Location' | sed 's/\r//' | egrep -o '[0-9]+.[0-9]+.[0-9]+$')
MACHINE_VERSION=$(curl -s -XHEAD -I https://github.com/docker/machine/releases/latest | egrep '^Location' | sed 's/\r//' | egrep -o '[0-9]+.[0-9]+.[0-9]+$')

DOCKER_TAR="docker-${DOCKER_VERSION}.tgz"
COMPOSE_BIN="docker-compose-${COMPOSE_VERSION}"
MACHINE_BIN="docker-machine-${MACHINE_VERSION}"

if [ ! -f "${DOCKER_TAR}" ]; then
	curl -o "${DOCKER_TAR}" -L https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz
	TMPDIR=$(mktemp -d)
	tar -x -z -v -C "${TMPDIR}" -f "${DOCKER_TAR}"
	for f in "${TMPDIR}/docker/"*; do
		NAME=$(basename "$f")
		NAME_VERSIONED="${NAME}-${DOCKER_VERSION}"
		mv "$f" "${NAME_VERSIONED}"
		ln -sf "${NAME_VERSIONED}" "${NAME}"
	done
	rm -r "${TMPDIR}"
fi
if [ ! -f "${COMPOSE_BIN}" ]; then
	curl -o "${COMPOSE_BIN}" -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64
	chmod +x "${COMPOSE_BIN}"  
	ln -sf "${COMPOSE_BIN}" docker-compose
fi
if [ ! -f "${MACHINE_BIN}" ]; then
	curl -o "${MACHINE_BIN}" -L https://github.com/docker/machine/releases/download/v${MACHINE_VERSION}/docker-machine-Linux-x86_64
	chmod +x "${MACHINE_BIN}"  
	ln -sf "${MACHINE_BIN}" docker-machine
fi
