FROM almalinux:latest

LABEL maintainer="moran.layne@gmail.com"

# Install basic utilities: apache, zip, and unzip
RUN yum -y update && yum -y install httpd zip unzip && yum clean all

# Download zip file into root directory
ADD https://www.tooplate.com/zip-templates/2119_gymso_fitness.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Unzip the downloaded file
RUN unzip 2119_gymso_fitness.zip

# Copy the contents of 'photogenic' dir to the current directory
RUN cp -rvf 2119_gymso_fitness/* .

# Remove the 'photogenic' directory and the zip file to clean up
RUN rm -rf 2119_gymso_fitness 2119_gymso_fitness.zip

# Default command at runtime
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose HTTP port
EXPOSE 80
