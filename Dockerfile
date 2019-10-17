FROM nginx:1.17.3-alpine


# do all in one step
RUN set -ex && \
    apk --no-cache add curl=7.66.0-r0 ca-certificates=20190108-r0 bash=5.0.0-r0 && \
    #Added  by Alex \
    #Alex added --no-cache
    apk --no-cache add net-tools=1.60_git20140218-r2 nano=4.3-r0 && \
    rm -rf /tmp/* /var/cache/apk/*

#Alex
#disable coloring for nano, see https://stackoverflow.com/a/55597765/1137529
RUN echo "syntax \"disabled\" \".\"" > ~/.nanorc; echo "color green \"^$\"" >> ~/.nanorc

#work-arround for nano
#Odd caret/cursor behavior in nano within SSH session,
#see https://github.com/Microsoft/WSL/issues/1436#issuecomment-480570997
ENV TERM eterm-color





#docker rmi -f static-pages
#docker rm -f pages
#docker build --squash . -t static-pages
#docker run --name pages -d -p80:80 static-pages
#smoke test
#docker exec -it $(docker ps -q -n=1) ps aux | grep 'nginx: master'
#docker exec -it $(docker ps -q -n=1) bash
#docker tag run-env alexberkovich/alpine-nginx:0.0.1
#docker push alexberkovich/alpine-nginx

# EOF