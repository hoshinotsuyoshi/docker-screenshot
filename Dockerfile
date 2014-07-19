FROM dockerfile/chrome
RUN apt-get update
RUN apt-get -y install gnome-screenshot xclip imagemagick
RUN apt-get -y install ruby
ADD .vnc /root/.vnc
ENV USER root
ENV DISPLAY :1
ADD chrome_data_dir /root/chrome_data_dir
RUN mkdir /root/image_dir

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh
ADD chrome.sh chrome.sh
RUN chmod +x /chrome.sh
ADD start.sh start.sh
RUN chmod +x /start.sh

ADD shot.sh shot.sh
RUN chmod +x /shot.sh
ENTRYPOINT ["/start.sh"]
