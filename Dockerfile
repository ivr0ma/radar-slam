FROM osrf/ros:melodic-desktop-full-bionic

ARG USER=radar
ARG UID=1000
ARG GID=1000
ARG PW=1111

# Add user and his password
RUN useradd -m ${USER} --uid=${UID} && \
    echo "${USER}:${PW}" | chpasswd && \
    usermod -s /bin/bash ${USER} && \
    usermod -a -G sudo ${USER}

# ARG USERNAME=roma-ros
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# # Create the user
# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
#     #
#     # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
#     && apt-get update \
#     && apt-get install -y sudo \
#     && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#     && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get install -q -y \
    openssh-client \
    libgoogle-glog-dev \
    gfortran \
    ros-melodic-catkin \
    python3-catkin-tools \
    ros-melodic-rqt-image-view \
    ros-melodic-octomap-rviz-plugins && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -q -y \
    vim \
    git \
    tmux \
    python3-pip \
    gcc \
    g++ \
    gdb 

RUN apt-get update && apt-get install -q -y \
    libpcl-dev \
    libeigen3-dev

# Add workspace
# RUN mkdir -p /home/${USER}/catkin_ws/src && \
#     chown -R ${UID}:${GID} /home/${USER}
# RUN mkdir -p /run/user/1000/ && \
#     chmod 0700 /run/user/1000/

# WORKDIR /home/${USERNAME}
USER ${UID}:${GID}

RUN echo "source /opt/ros/melodic/setup.bash" >> /home/${USER}/.bashrc

ENTRYPOINT ["./ros_entrypoint.sh"]
CMD [ "bash" ]
