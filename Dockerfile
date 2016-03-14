FROM scy83/nikola

USER root

# "dpkg-recofigure locales" ignores debconf-set-selections, therefore we do it via locale.gen.
RUN sed -i '/^# de_DE.UTF-8 UTF-8$/s/^# //' /etc/locale.gen \
	&& dpkg-reconfigure -f noninteractive locales

USER nikola

COPY conf.py conf.py

COPY files files

COPY everywhere everywhere
