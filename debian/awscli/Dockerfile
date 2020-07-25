# nk
# container for aws-cli


# i.e.
# docker run    -d \
#		--rm \
#		--name awscli \
#		--env-file ~/.aws/credentials \
#		njka/awscli:stretch


FROM		debian:stretch-slim
LABEL		maintainer "njka <njka.github@gmail.com>"


# install pre-req's
# refer to https://github.com/aws/aws-cli/issues/1957
# and https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html#install-tool-pip

# python3-setuptools should be in the list of dependencies but it isn't
# root@0641441e3c54:~# apt-cache depends awscli
# awscli
#   Depends: python3
#   Depends: python3-botocore
#   Depends: python3-colorama
#   Depends: python3-docutils
#   Depends: python3-rsa
#   Depends: python3-s3transfer
#   Depends: <python3:any>
#     python3

RUN		apt-get update \
 		&& apt-get install -y --no-install-recommends \
 			python3-setuptools \
 			groff \
 			less \
 			awscli \
 		&& rm -rf /var/lib/apt/lists/*
			

# ENTRYPOINT	[ "aws" ]
ENTRYPOINT	[ "/bin/su" ]
CMD		[ "-" ]
