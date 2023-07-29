FROM osrf/ros:melodic-desktop-full-bionic

# Users parameters
ARG USER=radar
ARG UID=1000
ARG GID=1000
ARG PW=1111

# Add user and his password
RUN useradd -m ${USER} --uid=${UID} && \
    echo "${USER}:${PW}" | chpasswd && \
    usermod -s /bin/bash ${USER} && \
    usermod -a -G sudo ${USER}

# Main dependencies
RUN apt-get update && apt-get install -q -y \
    openssh-client \
    libgoogle-glog-dev \
    gfortran \
    ros-melodic-catkin \
    python3-catkin-tools \
    ros-melodic-rqt-image-view \
    ros-melodic-octomap-rviz-plugins && \
    rm -rf /var/lib/apt/lists/*

# Other dependencies
RUN apt-get update && apt-get install -q -y \
    vim \
    git \
    tmux \
    python3-pip \
    gcc \
    g++ \
    gdb 

# Dependent libraries
RUN apt-get update && apt-get install -q -y \
    libpcl-dev \
    libeigen3-dev

USER ${UID}:${GID}

RUN echo "source /opt/ros/melodic/setup.bash" >> /home/${USER}/.bashrc

ENTRYPOINT ["./ros_entrypoint.sh"]
CMD [ "bash" ]
