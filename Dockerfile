FROM dockerfile/chrome
RUN apt-get update
RUN apt-get -y install gnome-screenshot xclip imagemagick
RUN apt-get -y install ruby
ADD .vnc /root/.vnc
ENV USER root
ENV DISPLAY :1
ADD chrome_data_dir /root/chrome_data_dir

RUN mkdir -p /data
ADD web /data/web
RUN cd /data/web && gem install bundler
RUN cd /data/web && bundle

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh
ADD chrome.rb chrome.rb
RUN chmod +x /chrome.rb
ADD start.sh start.sh
RUN chmod +x /start.sh
ADD shot.rb shot.rb
RUN chmod +x /shot.rb

ENTRYPOINT ["/start.sh"]
