FROM debian:7.7
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /
RUN dpkg -i "http://mapcrafter.org/debian/packages/mapcrafter_1.5.4_amd64.deb"
ADD render.conf /render.conf
CMD ["mapcrafter", "-c", "/render.conf", "-j", "2"]
