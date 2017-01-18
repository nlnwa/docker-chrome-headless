# docker-chrome-headless

docker run -it --rm -p=0.0.0.0:9222:9222 --name=chrome-headless -e "PROXY=localhost:8080" -v /tmp/chromedata/:/data norsknettarkiv/headless-chrome

