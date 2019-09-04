FROM ros:kinetic-ros-core-xenial
MAINTAINER Yiping Xie yipingx@kth.se
RUN apt-get update \
	&& apt-get install -y libcereal-dev libglfw3-dev libceres-dev libtinyxml2-dev libopencv-dev
RUN git clone https://github.com/nilsbore/auvlib.git
WORKDIR auvlib
RUN git submodule update --init && mkdir -p build
#RUN mkdir -p build && apt-get update && apt-get install -y libcereal-dev libglfw3-dev libceres-dev libtinyxml2-dev \
#&& git submodule update --init
#WORKDIR libigl
#RUN git submodule update --init external/embree 
#&& git submodule update --init external/glfw
WORKDIR build
#RUN apt-get update && apt-get install -y libopencv-dev
RUN cmake -DCMAKE_INSTALL_PREFIX=../install .. 
&& make -j4
RUN make install

RUN echo "export PYTHONPATH=$PYTHONPATH:/auvlib/install/lib" >> ~/.bashrc && /bin/bash -c "source ~/.bashrc"  && rm -rf /var/lib/apt/lists/*



