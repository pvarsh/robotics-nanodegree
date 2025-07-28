FROM ros:noetic

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USERNAME=rosuser

# Create user and group
RUN groupadd -g ${GROUP_ID} ${USERNAME} && \
    useradd -m -u ${USER_ID} -g ${GROUP_ID} ${USERNAME}

# Install required packages
RUN apt-get update && apt-get install -y \
    gazebo11 \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    ros-noetic-rqt* \
    x11-apps \
    iputils-ping \
    vim curl git \
    && apt-get clean

# Add .vimrc and set ownership
COPY .vimrc /home/${USERNAME}/.vimrc
RUN chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.vimrc

# Install vim-plug
USER ${USERNAME}
RUN curl -fLo /home/${USERNAME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set ROS environment for the user
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/${USERNAME}/.bashrc

# Switch to non-root user
USER ${USERNAME}
WORKDIR /home/${USERNAME}

CMD ["bash"]

