FROM nulang/nu-server:latest
MAINTAINER Tim Burks <tim@radtastical.com>

ENTRYPOINT ["/root/site.nu"]
EXPOSE 8080
