# Should follow the below
# https://docs.rockylinux.org/10/gemstones/containers/docker/

sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl --now enable docker