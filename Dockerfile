FROM debian

RUN apt update && \
    apt install python3 python3-pip -yqq

RUN apt install build-essential git subversion cmake libx11-dev libxxf86vm-dev libxcursor-dev libxi-dev libxrandr-dev libxinerama-dev -yqq && \
    apt install libwayland-dev wayland-protocols libxkbcommon-dev libdbus-1-dev linux-libc-dev -yqq

RUN mkdir /code && cd /code

RUN git clone https://github.com/blender/blender.git && cd blender

RUN cd lib && svn checkout https://svn.blender.org/svnroot/bf-blender/trunk/lib/linux_x86_64_glibc_228

RUN cd /code/blender && \
    make update && \
    make

WORKDIR /code