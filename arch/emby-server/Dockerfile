# nk
# 2018-06-17
# run emby-server
#
# i.e:
# docker run -it \
#	--rm \
#	-p 8096:8096 \
#	-e MONO="/usr/bin/mono" \
#	-e PROGRAM_DATA="/config" \
#	-e FFMPEG="/usr/bin/ffmpeg" \
#	-e FFPROBE="/usr/bin/ffprobev" \
#       -v $HOME/$EMBY-CONTENT:/var/lib/emby \
#       --name emby-server \
#	njka/arch-emby-unlocked


# lets go
FROM base/archlinux:latest
LABEL Maintainer "njka <njka.github@gmail.com>"


# standard stuff
# update pkg meta-data and install pre-reqs
RUN pacman -Suy --noconfirm \
	&& pacman -S --noconfirm base-devel git sudo


# makepkg doesn't like to be run as root
# plus we'll want an unpriviliged account for running emby-server-unlocked anyway
RUN groupadd emby \
	&& useradd -g emby -b /var/lib -m emby \
	&& printf 'emby ALL=(ALL) NOPASSWD: ALL\n' | tee -a /etc/sudoers


# clone aur repo, then create and install the package
RUN sudo -u emby bash -c 'cd ~ \
	&& chmod 755 /var/lib/emby \
	&& git clone https://aur.archlinux.org/emby-server-unlocked.git emby-server-unlocked \
	&& cd emby-server-unlocked \
	&& makepkg -s --noconfirm \
	&& sudo pacman -U --noconfirm emby-server-unlocked*.xz'


# clean shit up
# emby-server executable isn't executeable... funny.
COPY run.sh /root
RUN chmod +x /root/run.sh
RUN usermod -s /bin/false emby
RUN rm -rf /var/lib/emby/emby-server-unlocked
RUN chmod +x /usr/lib/emby-server/MediaBrowser.Server.Mono.exe


# run emby
# env vars set in script
ENTRYPOINT ["/root/run.sh"] 
