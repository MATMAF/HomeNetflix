# HomeNetflix
HomeNetflix is for Ubuntu.

## Install
First you have to use sudo
```bash
sudo su
```
Then, install docker and make it executable:
```bash
git clone https://github.com/MATMAF/HomeNetflix.git
cd HomeNetflix
chmod +x install-docker-ubuntu.sh
```
```sh
./install-docker-ubuntu.sh
```
Now you have to run the containers
```bash
chmod +x install.sh
```
```sh
./install.sh
```
Containers used
* [Homarr](https://github.com/ajnart/homarr)
* [Jellyfin](https://jellyfin.org/)
* [Portainer](https://www.portainer.io/)
* [Transmission](https://transmissionbt.com/)
* [WebSSH](https://github.com/huashengdun/webssh)
