FROM centos:7 
MAINTAINER MIRhosting <dev@mirhosting.com> 

ENV container docker 

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/; \
rm -f /etc/systemd/system/.wants/; \
rm -f /lib/systemd/system/local-fs.target.wants/; \
rm -f /lib/systemd/system/sockets.target.wants/udev; \
rm -f /lib/systemd/system/sockets.target.wants/initctl; \
rm -f /lib/systemd/system/basic.target.wants/; \
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]

RUN yum -y install wget openssh-server

COPY assets/wwwacct.conf /etc/wwwacct.conf
RUN mkdir /root/cpanel_profile/
COPY assets/cpanel.config /root/cpanel_profile/cpanel.config

RUN rm -f /etc/sysconfig/iptables
RUN touch /etc/fstab
RUN chmod 0640 /etc/fstab

RUN wget -O /usr/local/src/latest.sh http://httpupdate.cpanel.net/latest
RUN chmod +x /usr/local/src/latest.sh
RUN /usr/local/src/latest.sh --target /usr/local/src/cpanel/ --noexec
RUN sed -i 's/check_hostname();/# check_hostname();/g' /usr/local/src/cpanel/install

RUN cd /usr/local/src/cpanel/ && ./bootstrap --force

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 20 21 22 25 53 80 110 143 443 465 587 993 995 2077 2078 2082 2083 2086 2087 2095 3306

ENTRYPOINT /root/start.sh
CMD ["/usr/sbin/init"]
