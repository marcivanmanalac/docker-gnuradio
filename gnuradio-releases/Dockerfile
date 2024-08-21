#1 Ubuntu 22.04, JAMMY is required in order to install gnuradio 3.10
FROM ubuntu:22.04
LABEL maintainer="Federico 'Larroca' La rocca - flarroca@fing.edu.uy"

ENV DEBIAN_FRONTEND=noninteractive
#2
RUN apt-get update

#3 else it will output an error about Gtk namespace not found
RUN apt-get install -y gir1.2-gtk-3.0 

#4 to have add-apt-repository available
RUN apt-get install -y software-properties-common
#5
RUN add-apt-repository -y ppa:gnuradio/gnuradio-releases

#6 create user gnuario with sudo (and password gnuradio)
RUN apt-get install -y sudo
RUN useradd --create-home --shell /bin/bash -G sudo gnuradio
RUN echo 'gnuradio:gnuradio' | chpasswd

# I create a dir at home which I'll use to persist after the container is closed (need to change it's ownership)
RUN mkdir /home/gnuradio/persistent  && chown gnuradio /home/gnuradio/persistent

RUN apt-get update

RUN apt-get install -y gnuradio

# installing other packages needed for downloading and installing OOT modules
RUN apt-get install -y gnuradio-dev cmake git libboost-all-dev libcppunit-dev liblog4cpp5-dev python3-pygccxml pybind11-dev liborc-dev python3-pip libgsl-dev python3

# of course, nothing useful can be done without vim
RUN apt-get install -y vim 

# Fix dependency issue as noted on 'InstallingGR' wiki page for 3.10
RUN apt-get install -y python3-packaging

# Install Gtk3.0
RUN apt-get install -y libgtk-3-dev
# Install PangoCairo 1.0
RUN apt-get install -y libpangocairo-1.0-0

USER gnuradio

WORKDIR /home/gnuradio

#FROM python:3.10
# Define PYTHONPATH to include gnuradio's python3 dist-packages
ENV PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python3/dist-packages"

CMD [ "bash" ]
