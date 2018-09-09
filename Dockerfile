FROM quantumobject/docker-shiny


RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

RUN apt-get update && apt-get install -y libpq-dev \
										libssh-dev\
										libssl-dev\
										libxml2-dev


ARG source

EXPOSE 3838
COPY . /tmp
RUN Rscript /tmp/install_pckgs.R
# RUN echo docker > /tmp/conf.txt
