FROM dockerfile/chrome
RUN apt-get update
RUN apt-get -y install gnome-screenshot xclip imagemagick
RUN apt-get -y install ruby
ADD .vnc /root/.vnc
ENV USER root
ENV DISPLAY :1
ADD chrome_data_dir /root/chrome_data_dir
RUN mkdir /root/image_dir
ADD shot.sh shot.sh
RUN chmod +x /shot.sh
