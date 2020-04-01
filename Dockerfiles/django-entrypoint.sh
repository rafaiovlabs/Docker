#!/usr/bin/env bash
#
# Description: 
#	This script is the entrypoint of blogs/django container and is needed
# 	when building the container based on Dockerfile.django
#
# Contanc: rafael.ortiz
#
# Changelog:
#	- 25.10.2020: initial version

set -e

APPDIR="/app/"

cd $APPDIR

if [ "$1" = 'gunicorn' ] || [ "${#}" -eq 0 ]; then
	echo -n "[INFO] Running 'python manage.py collectstatic'..."
	python manage.py collectstatic --noinput >/dev/null
	echo "[OK]"
	echo "[INFO] Running 'python manage.py migrate'..."
	python manage.py migrate --noinput
	## start uWSGI
	uwsgi --master --http 0.0.0.0:8000 --chdir /app/ --wsgi-file /app/example/wsgi.py \
	--static-map /static/=/app/claro_rollout/static/ --static-map /media/=/app/media/		\
	--uid django --gid django --processes 5
else
	exec "$@"
fi
