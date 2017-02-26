FROM nginx

# Install software
RUN apt-get update
RUN apt-get -y install ruby git bundler

# Get code and generate site
RUN git clone http://github.com/DSALouisville/dsablog.git

# Enable SSL
#curl --silent https://raw.githubusercontent.com/srvrco/getssl/master/getssl > getssl ; chmod 700 getssl
#RUN ./getssl -c dsalouisville.org
#getssl dsalouisville.org

WORKDIR /dsablog
RUN bundle install
RUN jekyll build
RUN cp -r _site/* /usr/share/nginx/html

RUN service nginx restart
