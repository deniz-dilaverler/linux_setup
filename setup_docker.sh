# Add docker RPM package
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# Install docker packages
dnf install -y  docker-ce docker-ce-cli containerd.io  docker-buildx-plugin  docker-compose-plugin

# Make docker not use sudo on commands
groupadd docker
usermod -aG docker $USER
newgrp docker

