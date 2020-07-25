# nk
# 2018-06-17
# run google-chrome-stable and google-talkplugin in a container
#
# i.e:
# docker run -it \
#	--net host \
#       --memory 1gb \
#       -e DISPLAY=unix$DISPLAY \
#       -v /dev/shm:/dev/shm \
#       -v /tmp/.X11-unix:/tmp/.X11-unix \
#       -v $HOME/.config/google-chrome/:/home/chrome/data \
#       -v $HOME/Downloads:/home/chrome/Downloads \
#       --device /dev/snd \
#	--device /dev/dri \
#	--device /dev/video0 \
#       --name google-chrome \
#	--cap-add=SYS_ADMIN \
#	njka/google-chrome


# lets go
FROM base/archlinux:latest
LABEL Maintainer "njka <njka.github@gmail.com>"


# standard stuff - update pkg meta-data and install pre-reqs
RUN pacman -Syu --noconfirm \
	&& pacman -S --noconfirm base-devel git libnotify libpng pulseaudio sudo ttf-liberation xdg-utils


# makepkg doesn't like to be run as root
# plus we'll want an unpriviliged account for running chrome anyway
RUN groupadd chrome \
	&& useradd -g chrome -m chrome \
	&& mkdir /home/chrome/{Downloads,data} \
	&& chown -R chrome:chrome /home/chrome \
	&& echo "chrome ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


# google-chrome first
# clone google-chrome aur repo, then create and install the package
RUN sudo -u chrome bash -c 'cd ~ \
	&& git clone https://aur.archlinux.org/google-chrome.git google-chrome \
	&& cd google-chrome \
	&& makepkg -s --noconfirm \
	&& sudo pacman -U --noconfirm google-chrome*.xz'


# now google-talkplugin
# separate from chrome installation so it can be easily commented out if not wanted/needed
RUN sudo -u chrome bash -c 'cd ~ \
	&& git clone https://aur.archlinux.org/google-talkplugin.git google-talkplugin \
	&& cd google-talkplugin \
	&& makepkg -s --noconfirm \
	&& sudo pacman -U --noconfirm google-talkplugin*.xz'


# clean shit up
RUN usermod -s /bin/false chrome \
	&& rm -rf /home/chrome/google-* \
	&& sed -i '/chrome/d' /etc/sudoers
	# look into removing shit... this image seems kinda big
	# && pacman -Rscn base-devel git sudo


# run chrome
USER chrome
ENTRYPOINT ["google-chrome-stable"]
CMD ["--user-data-dir=/home/chrome/data"]
