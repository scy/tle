FROM scy83/nikola

USER root

# "dpkg-recofigure locales" ignores debconf-set-selections, therefore we do it via locale.gen.
RUN sed -i '/^# de_DE.UTF-8 UTF-8$/s/^# //' /etc/locale.gen \
	&& dpkg-reconfigure -f noninteractive locales

COPY conf.py    conf.py
COPY files      files
COPY pages      pages
COPY everywhere everywhere

RUN chown nikola:nikola \
		conf.py everywhere files pages

USER nikola
