#!/bin/bash

docker run -it \
  --net=host \
  --user=$(id -u):$(id -g) \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/projects/robotics-udacity/gazebo_models:/home/rosuser/gazebo_models \
  ros-noetic-gazebo

