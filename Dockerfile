FROM centos:7

# Install basics
RUN yum -y install httpd;yum clean all; systemctl enable httpd.service
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils
RUN yum -y install php56 php56-php php56-php-mysqlnd php56-php-gd php56-php-mcrypt php56-php-mbstring php56-php-xml php56-php-cli
RUN yum-config-manager --enable remi-php56
RUN yum -y update
RUN yum -y install php-cli
# Expose apache.
EXPOSE 80
#EXPOSE 8080
#EXPOSE 443
EXPOSE 3306

COPY ./index.php  /var/www/html/
