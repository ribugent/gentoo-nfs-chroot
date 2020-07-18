FROM gentoo/stage3-amd64:latest

RUN emerge-webrsync \
	&& emerge -v nfs-utils \
	&& rm -rf /var/db/repos/gentoo/

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
