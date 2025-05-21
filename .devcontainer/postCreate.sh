#!/usr/bin/env zsh

# Import repositories
vcs import --input src/ros2.repos --skip-existing src/

# Ensure ROS dependencies are up-to-date
rosdep update

# Install dependencies from the src folder
sudo rosdep install --from-paths /home/ws/src --ignore-src -y

# Fix permissions in workspace
sudo chown -R $(whoami) /home/ws

# Navigate to workspace root for building
cd /home/ws

# Build workspace
colcon build --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXPORT_COMPILE_COMMANDS=ON