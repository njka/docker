# nk
# container for chrome


# i.e. (i snagged some of these options from jess frazelle)
# docker run	--rm \
#		--memory 2gb \
#		--group-add audio \
#		--device /dev/dri \
#		--device /dev/snd \
#		--device /dev/video0 \
#		--cap-add SYS_ADMIN \
#		--name docker-chrome \
#		--security-opt seccomp=/home/nk/etc/chrome.json \	# not needed w/CAP_SYS_ADMIN
#		-e DISPLAY=unix:0 \
#		-v /dev/shm:/dev/shm \
#		-v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v /etc/localtime:/etc/localtime:ro
#		-v $HOME/Downloads/chrome:/home/chrome/downloads \
#		-v $HOME/.config/google-chrome:/home/chrome/data \
#		njka/google-chrome


FROM		debian:stretch-slim
LABEL		maintainer "njka <njka.github@gmail.com>"


# install pre-req's, add google package signing key, add google repos and install google-chrome
# and google-talkplugin along w/some misc fonts from google's repository
RUN		apt-get update \
		&& apt-get install -y --no-install-recommends \
			apt-transport-https \
			apt-utils \
			ca-certificates \
			fonts-freefont-ttf \
			fonts-liberation \
			fonts-liberation2 \
			fonts-symbola \
			gnupg \
			hicolor-icon-theme \
			libappindicator3-1 \
			libcanberra-gtk* \
			libgl1-mesa-dri \
			libgl1-mesa-glx \
			libnspr4 \
			libnss3 \
			libpango1.0-0 \
			libpulse0 \
			libv4l-0 \
			libxss1 \
			lsb-release \
			procps \
			wget \
			xdg-utils \
		&& wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
		&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
		&& echo "deb [arch=amd64] https://dl.google.com/linux/talkplugin/deb/ stable main" > /etc/apt/sources.list.d/google-talkplugin.list \
		&& apt-get update \
		&& apt-get install -y --no-install-recommends \
			fonts-roboto-hinted \
			fonts-roboto-unhinted \
			google-chrome-stable \
			google-talkplugin \
		&& apt-get purge --auto-remove -y gnupg \
		&& rm -rf /var/lib/apt/lists/*


# add chrome user
ENV		HOME /home/chrome
RUN		groupadd -g 1000 -r chrome && useradd -r -m -g chrome -c chrome -u 1000 -G audio,video chrome \
		&& mkdir $HOME/{downloads,data} \
		&& chown -R chrome:chrome $HOME


# run chrome
USER		chrome
ENTRYPOINT	[ "google-chrome" ]
CMD		[ "--user-data-dir=/home/chrome/data" ]
