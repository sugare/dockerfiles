FROM centos:centos7

MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com"

RUN yum install -y ca-certificates wget

# Download certificate and key from the customer portal (https://cs.nginx.com)
# and copy to the build context
ADD nginx-repo.crt /etc/ssl/nginx/
ADD nginx-repo.key /etc/ssl/nginx/

# Get other files required for installation
RUN wget -q -O /etc/yum.repos.d/nginx-plus-7.repo https://cs.nginx.com/static/files/nginx-plus-7.repo

# Install NGINX Plus
RUN yum install -y nginx-plus

# forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]