#FROM debian
FROM nginxbase:latest
ENV nextclodversion 12.0.3
ENV http_proxy=http://192.168.0.1:3128
RUN apt-get update
COPY nextcloud_"${nextclodversion}"_amd64.deb /tmp
COPY nextcloud-nginx_"${nextclodversion}"_amd64.deb /tmp
RUN apt-get -y --fix-broken install \
	/tmp/nextcloud_*_amd64.deb \
	/tmp/nextcloud-nginx_*_amd64.deb \
	sudo
COPY start.sh /start.sh
RUN chmod u+rx /start.sh
EXPOSE 80 443
#CMD ["/start.sh"]
CMD ["/bin/sleep", "900"]

