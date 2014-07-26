FROM hoshinotsuyoshi/vncserver:ruby2-1-2
RUN mkdir -p /data
RUN mkdir -p /data/web
RUN mkdir -p /data/web/public

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh

ADD chrome-shot.rb chrome-shot.rb
RUN chmod +x /chrome-shot.rb

CMD ["/vncserver.sh"]
