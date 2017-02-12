jekyll build
docker build -t dsablog .
docker run -p 80:80 dsablog
