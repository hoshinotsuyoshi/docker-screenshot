FROM hoshinotsuyoshi/vncserver
RUN mkdir -p /data
RUN mkdir -p /data/web
RUN mkdir -p /data/web/public

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh
RUN /vncserver.sh

ADD chrome-shot.rb chrome-shot.rb
RUN chmod +x /chrome-shot.rb

