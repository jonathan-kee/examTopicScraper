# Should follow the below
# https://docs.rockylinux.org/10/gemstones/containers/docker/

sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl --now enable docker

# Add the current user
sudo usermod -a -G docker $(whoami)

# Apply the group changes:
newgrp docker

# Restart the Docker service (if needed):
sudo systemctl restart docker