# nk
# container for spotify-client
# make sure pulseaudio isn't running on your host before running!


# i.e.
# docker run    --rm \
#		-v /etc/localtime:/etc/localtime:ro \
#		-v /tmp/.X11-unix:/tmp/.X11-unix \
#		-e DISPLAY=unix$DISPLAY \
#		--device /dev/snd:/dev/snd \
#		-v $HOME/.spotify/config:/home/spotify/.config/spotify \
#		-v $HOME/.spotify/cache:/home/spotify/spotify \
#		--name spotify-client \
#		njka/spotify-client


FROM		debian:stretch-slim
LABEL		maintainer "njka <njka.github@gmail.com>"


# install apt-utils and set the locale:
RUN		apt-get update \
		&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		apt-utils \
		locales \
		&& sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
		&& locale-gen

ENV		LANGUAGE	en_US:en \
		LC_ALL		en_US.UTF-8


# install pre-req's, configure spotify repo and install the spotify client:
RUN		DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		alsa-utils \
		apt-utils \
		dirmngr \
		gnupg \
		libgl1-mesa-dri \
		libgl1-mesa-glx \
		libpulse0 \
		xdg-utils \
		&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 \
		&& echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list \
		&& apt-get update \
		&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
		--no-install-recommends \
		spotify-client \
		&& rm -rf /var/lib/apt/lists/*


# add spotify user:
ENV		HOME /home/spotify
RUN		groupadd -r spotify \
		&& useradd -r -m -g spotify -G audio,video spotify \
		&& echo "QLineEdit { color: #000 }" > $HOME/spotify-override.css \
		&& chown -R spotify:spotify $HOME


# run spotify:
WORKDIR		$HOME
USER		spotify
ENTRYPOINT	[ "spotify" ]
CMD		[ "-stylesheet=/home/spotify/spotify-override.css" ]
