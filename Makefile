DC = docker compose
EXEC = docker exec -it
LOG = docker logs

COLOR_RED = \033[0;31m
COLOR_GREEN = \033[0;32m
COLOR_YELLOW = \033[0;33m
COLOR_BLUE = \033[0;34m
COLOR_END = \033[0m

.PHONY: default u d l lf e

default: u
# Start containers
u: up install
up:
	$(DC) up -d
# Shutdown containers
d:
	$(DC) down

# Restart containers
r: d u

# Enter container
e/%:
	$(EXEC) $(@F) bash

# Get container's logs
l/%:
	$(LOG) $(@F)
# Get container's logs (continuous)
lf/%:
	$(LOG) $(@F) -f


install: install/gnb-ul1 install/gnb-ul2 install/gnb-dl install/srgw install/rr install/r0 install/r1

install/%:
	$(EXEC) $(@F) make install
s/%:
	$(EXEC) $(@F) srv6 -c ../config/$(@F).yaml

