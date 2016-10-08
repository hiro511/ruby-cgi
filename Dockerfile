FROM httpd:2.4
MAINTAINER Hiroaki Egashira

RUN apt-get update && apt-get install -y \
    ruby \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN sed -ri 's/#LoadModule cgid_module/LoadModule cgid_module/g; \
             s/DirectoryIndex index.html/DirectoryIndex index.cgi/g; \
             s/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/g; \
             s/#AddHandler cgi-script .cgi/AddHandler cgi-script .rb .cgi/g' /usr/local/apache2/conf/httpd.conf
