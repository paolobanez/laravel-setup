FROM ubuntu:18.04
LABEL maintainer="paolobanez@gmail.com"

# Install apache, PHP, and supplimentary programs. curl, and lynx-cur are for debugging the container.
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install imagemagick
RUN apt-get -y install vim apache2 php libapache2-mod-php php-mcrypt php-curl php-cli php-common php-json php-mysql php-readline php-mbstring php-xml php-imagick php-zip curl php-intl lynx-cur php-soap poppler-utils
