# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images/create_ros_image.Dockerfile.em
#FROM ros:kinetic-ros-core-xenial
# install ros packages and auvli
#FROM ubuntu:16.04
FROM ros:kinetic-ros-core-xenial
MAINTAINER Yiping Xie yipingx@kth.se
RUN apt-get update \
#	&& apt-get install -y build-essential \
#	cmake \
#	git \
	&& apt-get install -y libopencv-dev \
	python-opencv \ 
	libcereal-dev \
	libglfw3-dev \
	libceres-dev \
	libtinyxml2-dev \
    	&& rm -rf /var/lib/apt/lists/* 
RUN apt-get update && apt-get install -y python-pip && pip install ipython==5.0
RUN echo "export PYTHONPATH=$PYTHONPATH:/.local/auvlib/install/lib" >> ~/.bashrc && /bin/bash -c "source ~/.bashrc"
#RUN git clone https://github.com/nilsbore/auvlib.git
#WORKDIR auvlib
#	&& git submodule update --init 
#WORKDIR libigl 
#RUN git submodule update --init external/embree \
#	&& git submodule update --init external/glfw 
#WORKDIR ../build
#RUN apt-get update && apt-get install -y libopencv-dev python-opencv
#RUN pip install opencv-python
#RUN  cmake -DCMAKE_INSTALL_PREFIX=../install .. || exit 0
#RUN  make -j4 && make install 
	


