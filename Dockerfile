FROM hoshinotsuyoshi/vncserver
RUN mkdir -p /data
RUN mkdir -p /data/web
ADD web/Gemfile /data/web/Gemfile
RUN cd /data/web && gem install bundler
RUN cd /data/web && bundle

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh
ADD chrome-shot.rb chrome-shot.rb
RUN chmod +x /chrome-shot.rb
ADD start.sh start.sh
RUN chmod +x /start.sh

# web app
ADD web/config.ru /data/web/config.ru
ADD web/app.rb /data/web/app.rb

ENTRYPOINT ["/start.sh"]
