# nk
# container for irssi


# i.e.
# docker run	--rm \
#		--name docker-irssi \
#		-e TERM=xterm-256256color \
#		-v $HOME/.irssi:/home/irssi/.irssi:ro \
#		-v /etc/localtime:/etc/localtime:ro \
#		njka/irssi:alpine


FROM		alpine:latest
LABEL		maintainer "njka <njka.github@gmail.com>"


ENV		LANG C-UTF-8


# instal irssi from 'edge' to get v1.2.x and not v0.8.x
RUN		apk --no-cache add \
			--repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
			irssi \
		&& apk --no-cache add \
			ca-certificates \
			perl-datetime \
			perl-timedate \
		&& addgroup -g 1000 irssi && adduser -D -G irssi -u 1000 irssi


USER		irssi
CMD		[ "irssi" ]
