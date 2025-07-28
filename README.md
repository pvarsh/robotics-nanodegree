# Robotics

This is my repo for working through Udacity's [Robotics Software Engineer](https://www.udacity.com/enrollment/nd209) nanodegree.

### 🖥️ Development Environment: Parallels on macOS

This project is developed inside a **Parallels VM running Ubuntu 24.04 LTS** on an **Apple Silicon Mac** (M1/M2). The VM provides a Linux-native environment needed for robotics development with **ROS1 (Noetic)** and **Gazebo Classic**, as used in the [Udacity Robotics Software Engineer Nanodegree](https://www.udacity.com/course/robotics-software-engineer--nd209).

Development inside the VM uses:

- **Docker** for isolated ROS/Gazebo environments, including GUI apps like `gazebo` (via X11 inside the VM)
- **Vim** with a custom `.vimrc` and plugins for editing `.sdf`, `.urdf`, `.launch`, and source code
- **SSH with a dedicated key** and `ssh-agent` to enable seamless GitHub integration
- **Mounted host folders** in Docker for persistent storage of Gazebo models and source files

This setup keeps development reproducible, isolated from the host macOS, and (according to ChatGPG) aligned with common robotics workflows.

### ⚙️ Environment Setup

This project runs inside a Parallels VM with Ubuntu 24.04 on an Apple Silicon Mac. It uses Docker to run ROS1 Noetic and Gazebo Classic in a reproducible containerized environment.

#### 1. Install Docker (inside Ubuntu VM)

```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker’s repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
```

To run Docker without `sudo`, add your user to the `docker` group:

```bash
sudo usermod -aG docker $USER
newgrp docker  # or log out and log back in
```

#### 2. Build the Docker image

```bash
cd VMDocker
docker build -t ros-noetic-gazebo .
```

#### 3. Run the container

```bash
./run_gazebo.sh
```

This script starts the container with:
- GUI support via X11
- Host networking for ROS/Gazebo communication
- A mounted volume for persistent model storage
- Non-root user access for smoother X11 permissions

#### 4. Inside the container

```bash
gazebo
```

#### 5. Vim Setup

The container includes Vim preconfigured with plugins for editing `.sdf`, `.urdf`, `.launch`, and ROS source files.  
To install plugins:

```bash
vim +PlugInstall +qall
```

```vim
" (If needed: inside Vim)
:PlugInstall
```


### How I use AI in this project

I'm using an AI assistant (ChatGPT, Claude Code) to help navigate tooling and answer clarifying questions like

- How can I run Gazebo Classic and ROS1 in Parallels on Ubuntu 24 on a Mac M1 with GUI support?
- “Should I define behavior in ROS or Gazebo?”
- “How do I configure Vim for editing `.sdf`, `.urdf`, and ROS files?”
- Which files should be in .gitignore

and it has been tremendously helpful.

