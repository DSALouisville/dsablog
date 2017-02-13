FROM nginx

RUN apt-get update
RUN apt-get -y install ruby git bundler
RUN git clone git@github.com:DSALouisville/dsablog.git
WORKDIR /dsablog
RUN bundle install
RUN jekyll build
RUN cp -r _site /usr/share/nginx/html

COPY _site /usr/share/nginx/html

