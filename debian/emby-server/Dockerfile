# nk
# run an emby server in a minimal debian stretch container


# i.e.
# docker run	-d \
#		--rm \
#		-p 8096:8096 \
#		--name emby-server \
#		-v /path/to/local/movies:/container/dir


FROM		debian:stretch-slim
LABEL		maintainer "njka <njka.github@gmail.com>"


# i created this tarball from the /opt/emby-server directory tree that was
# created from manually installing emby-server-deb_4.1.1.0_amd64.deb
# which i downloaded, extracted and modified:
# https://github.com/MediaBrowser/Emby.Releases/releases/download/4.1.1.0/emby-server-deb_4.1.1.0_amd64.deb
COPY		emby-opt.tar.gz		/root


RUN		groupadd -r emby \
		&& useradd -r \
			-g emby \
			-c 'Emby Server' \
			-md /var/lib/emby \
			-s /usr/bin/nologin emby \
		&& passwd -l emby >> /dev/null \
		&& usermod -aG video emby \
		&& chmod 755 /var/lib/emby \
		&& chown -R emby:emby /var/lib/emby \
		&& tar -C / -zxf /root/emby-opt.tar.gz \
		&& chown -R emby:emby /opt/emby-server


ENTRYPOINT	[ "/opt/emby-server/bin/emby-server" ]
