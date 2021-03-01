# njka
# container for aws cli v2


FROM		alpine:3.13.2
LABEL		maintainer "<njka.github@gmail.com>"


# define rev of glibc to be used:
ENV		GLIBC_VER=2.33-r0


# install pre-req tools:
RUN		apk add --no-cache \
			bash \
			curl \
			groff \
			binutils \


		# download sgerrand's apline-pkg-glibc packages from https://github.com/sgerrand/alpine-pkg-glibc:
		&& curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
		&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
		&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
		&& curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-i18n-${GLIBC_VER}.apk \


		# install sgerrand's glibc pkg's:
		&& apk add --no-cache \
			glibc-${GLIBC_VER}.apk \
			glibc-bin-${GLIBC_VER}.apk \
			glibc-i18n-${GLIBC_VER}.apk \


		# generate locale for the aws cli:
		&& /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \


		# download, unpack and install the aws cli bundle per
		# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install:
		&& curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
		&& unzip awscliv2.zip \
		&& aws/install \


		# clean up aws cli artifacts:
		&& rm -rf \
			aws \
			glibc-*.apk \
			awscliv2.zip \
			/usr/local/aws-cli/v2/*/dist/awscli/examples \


		# uninstall pre-req installation tools:
		&& apk del --no-cache \
			curl \
			binutils \


		# just to be sure we're clean:
		&& rm -rf /var/cache/apk/* \


		# change root's shell to bash for aws cli command completion:
		&& sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd \


		# configure the environment for aws cli command completion:
		&& echo "complete -C '/usr/local/bin/aws_completer' aws" >> /root/.bashrc


ENTRYPOINT	[ "aws" ]
