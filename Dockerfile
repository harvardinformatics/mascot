FROM rsrchboy/perlbrew-base:latest

EXPOSE 80

RUN apt-get update && apt-get -y install \
    gcc \
    apache2 \
    libapache2-mod-perl2 \
    make \
    libwww-perl \
    pkg-config \
    libgd2-dev \
    supervisor


RUN perlbrew install perl-5.14.4 && \
    perlbrew use perl-5.14.4 && \
    ln -s  /usr/local/perlbrew/perls/perl-5.14.4/bin/perl /usr/local/bin/perl

RUN cpanm Algorithm::Diff \
    GD \
    HTML::Entities \
    HTTP::Date \
    HTTP::Headers \
    HTTP::Negotiate \
    LWP::UserAgent \
    XML::Simple

COPY etc/supervisor.conf /etc/supervisor/conf.d/app.conf
COPY etc/mascot.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod perl && a2enmod cgid && a2enmod rewrite

WORKDIR /usr/local/mascot

CMD ["/usr/bin/supervisord","-n"]
