# Start with the rocker/rstudio image
FROM rocker/rstudio:latest

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    unixodbc-dev \
    libxml2-dev \
    libmariadb-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('hal9001', 'dplyr', 'ggplot2', 'caret', 'glmnet', 'ranger'))"
# v2 install
RUN R -e "install.packages(c('tidyverse'))"
# v3 install
RUN R -e "install.packages(c('doParallel', 'mice', 'xgboost'))"
# v4 install
RUN apt-get update && apt-get install -y cmake && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('mice'))"
# v5 install
RUN apt-get update && apt-get install -y openssh-server && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('languageserver'))"
RUN mkdir -p /home/rstudio/.ssh && chmod 660 /home/rstudio/.ssh
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCamnL+/Fg42rN2uwtnps26K5ZRua4sg/B8Zjw7cuKSbe5g9HocNEx0LudOLkii853HbTjEd0BtyWHWNzfU5v3CdgknSC8GV9+eRUPnHA4y+fKIBkCLkF5YnSfV3BIYfIDISVyqraSQ2WepRABu9Xb4QdIiNP8kMthRLbf8Kzai2W+DUygv8cC9rsBIguskr7Fase0Mm810YpVV84PEjvWmiG6JjQKG8C/jDYYSk5cO3Vn1FKimlVUFoxyZb2KEVsUEM6ySz5aw09zmS/4ilVhVlQXDI2whujqsXzjElb22UITJnqKpPIqeU86nVfsP4u5e4h+kVDno+o+0OC3JMHVl adls371@163.com' > /home/rstudio/.ssh/authorized_keys
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvyeab4MBPQCFHhEkMxpB0irUNTgAP0AWCajuBQYyYGfefUfZl4xVjMoDXnInXUdFlSSRuen4ZvJaYe73NkSoRpw4Tp9p/kof3e4AhQanImsfT9T25LWD7YMuzTP6p3OZZiUeZqn18VEJcuYnzScyaQOUUaVCD4f+yUSJ74rQPJ/u0x7QKkzlOjO7yFKx2NI26Oba6uHffe9WzURl4efYzay7ZPNI529ZR1G0DMgyk01RNaphSsN8Ou2pYWN9+jYwljo9I8SNJq24ZUoIAVMfsf9L01D2mj0A892VZoM+YzxbIlyTEljeOns/ZsdSjDduFRxahJ+rgimRpwOJg1WD5oIgWIWGe+EXcfI0vLB8mCsjgKU2BnDWHXpQ10NEUNp9RdStpidovwdpw78HdktU70l1H3LpNcof4wGHgnxpP1qZlSp3uf+wdl0tbrxT+Df3ZL/0I+EROS4SRBqVtbfikBiiasnAf9bjj56lMxbIb150gsKuoXca59do0aA3Dj3N3aRKu4r7lPVW6swLoy4TvCqY68lk06TR87tvcAjkbvAahtTysJa1ASPlNpgcFa1qAjDn4s9s3PG1H4NdzNKKWNz5GcGelfBUI+zN+DlVPAzXBsXkTDlT5gAVVnYBilwvDld26XdmK+0vZC+joshriwZ4BElJ8u2VCHZUbjE3oNQ== xin.fang0922@gmail.com' >> /home/rstudio/.ssh/authorized_keys
RUN mkdir -p /root/.ssh && chmod 600 /root/.ssh
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCamnL+/Fg42rN2uwtnps26K5ZRua4sg/B8Zjw7cuKSbe5g9HocNEx0LudOLkii853HbTjEd0BtyWHWNzfU5v3CdgknSC8GV9+eRUPnHA4y+fKIBkCLkF5YnSfV3BIYfIDISVyqraSQ2WepRABu9Xb4QdIiNP8kMthRLbf8Kzai2W+DUygv8cC9rsBIguskr7Fase0Mm810YpVV84PEjvWmiG6JjQKG8C/jDYYSk5cO3Vn1FKimlVUFoxyZb2KEVsUEM6ySz5aw09zmS/4ilVhVlQXDI2whujqsXzjElb22UITJnqKpPIqeU86nVfsP4u5e4h+kVDno+o+0OC3JMHVl adls371@163.com' > /root/.ssh/authorized_keys
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvyeab4MBPQCFHhEkMxpB0irUNTgAP0AWCajuBQYyYGfefUfZl4xVjMoDXnInXUdFlSSRuen4ZvJaYe73NkSoRpw4Tp9p/kof3e4AhQanImsfT9T25LWD7YMuzTP6p3OZZiUeZqn18VEJcuYnzScyaQOUUaVCD4f+yUSJ74rQPJ/u0x7QKkzlOjO7yFKx2NI26Oba6uHffe9WzURl4efYzay7ZPNI529ZR1G0DMgyk01RNaphSsN8Ou2pYWN9+jYwljo9I8SNJq24ZUoIAVMfsf9L01D2mj0A892VZoM+YzxbIlyTEljeOns/ZsdSjDduFRxahJ+rgimRpwOJg1WD5oIgWIWGe+EXcfI0vLB8mCsjgKU2BnDWHXpQ10NEUNp9RdStpidovwdpw78HdktU70l1H3LpNcof4wGHgnxpP1qZlSp3uf+wdl0tbrxT+Df3ZL/0I+EROS4SRBqVtbfikBiiasnAf9bjj56lMxbIb150gsKuoXca59do0aA3Dj3N3aRKu4r7lPVW6swLoy4TvCqY68lk06TR87tvcAjkbvAahtTysJa1ASPlNpgcFa1qAjDn4s9s3PG1H4NdzNKKWNz5GcGelfBUI+zN+DlVPAzXBsXkTDlT5gAVVnYBilwvDld26XdmK+0vZC+joshriwZ4BElJ8u2VCHZUbjE3oNQ== xin.fang0922@gmail.com' >> /root/.ssh/authorized_keys

# ENTRYPOINT service ssh start && tail -f /dev/null
# RUN sed -i '2i service ssh start' /init

# v6 install
RUN apt-get update && apt-get install -y libgit2-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('devtools'))"

EXPOSE 22

# Set default command
CMD service ssh start && /init
