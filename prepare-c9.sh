#!/bin/sh

set -e

sudo locale-gen en_US.UTF-8 de_DE.UTF-8
sudo update-locale

sudo apt update
sudo apt install --no-install-recommends -y \
	build-essential \
	libjpeg-dev \
	libxml2-dev \
	libxslt1-dev \
	libyaml-dev \
	libzmq3-dev \
	locales \
	python3 \
	python3-dev \
	python3-pip \
	zlib1g-dev

sudo pip3 install 'Nikola[extras]' awscli
