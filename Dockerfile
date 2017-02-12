FROM nginx

RUN apt-get update
RUN apt-get -y install ruby git bundler
COPY . /jekyll
WORKDIR /jekyll
RUN bundle install
RUN jekyll build
RUN cp -r _site /usr/share/nginx/html

COPY _site /usr/share/nginx/html

