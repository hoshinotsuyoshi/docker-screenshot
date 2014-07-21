FROM hoshinotsuyoshi/vncserver
RUN mkdir -p /data
RUN mkdir -p /data/web
RUN mkdir -p /data/web/public
RUN gem install bundler --no-ri --no-rdoc

ADD Gemfile /data/web/Gemfile
RUN cd /data/web && bundle --jobs 4

# web app
ADD config.ru /data/web/config.ru
ADD app.rb /data/web/app.rb
ADD start.sh /data/web/start.sh
RUN chmod +x /data/web/start.sh

ENTRYPOINT ["/data/web/start.sh"]
