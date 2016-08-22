FROM debian:jessie
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y varnish && \
    sed -i.original -e 's/port = "8080"/port = "80"/' /etc/varnish/default.vcl

CMD ["/bin/bash","-c","/usr/sbin/varnishd -a 0.0.0.0:80 -b web:80 -F -s malloc,100M"]
