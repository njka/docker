# nk
# container for awscli


# i.e.
# docker run    --rm \
#		--name awscli \
#		--env-file ~/.aws/credentials \
#		njka/awscli:alpine


FROM		alpine:latest
LABEL		maintainer "njka <njka.github@gmail.com>"


# install pre-req's
# refer to https://github.com/aws/aws-cli/issues/1957
# and https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html#install-tool-pip
# hmmm, maybe... apk --no-cache add --repository http://dl-cdn.alpinelinux.org/alpine/edge/[main|community|testing]
RUN		apk -v --no-cache add \
			less \
			groff \
			python \
			py2-pip \
			py-setuptools \
		&& pip --no-cache-dir install --upgrade awscli \
		&& apk --purge del py2-pip \
		&& rm -rf /var/cache/apk/* \
		&& rm -rf /root/.cache/pip \
		&& rm -rf /tmp/* \
		&& echo "export PAGER='less -R'" >> /root/.profile


ENTRYPOINT	[ "aws" ]
