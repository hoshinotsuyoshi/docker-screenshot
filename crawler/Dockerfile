FROM hoshinotsuyoshi/vncserver:ruby2-1-2
RUN mkdir -p /data
RUN mkdir -p /data/web
RUN mkdir -p /data/web/public

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh

ADD chrome-shot.rb chrome-shot.rb
RUN chmod +x /chrome-shot.rb

ADD start.rb start.rb
RUN chmod +x /start.rb

ADD start.sh start.sh
RUN chmod +x /start.sh

ADD . /data/crawler
RUN cd /data/crawler && bundle

CMD ["/start.sh"]
