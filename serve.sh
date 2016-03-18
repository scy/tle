#!/bin/sh

docker build -t scy83/tle:dev . && docker run --rm -it -p 80:8000 scy83/tle:dev serve
