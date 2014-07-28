FROM hoshinotsuyoshi/vncserver:ruby2-1-2
RUN mkdir -p /data
RUN mkdir -p /data/web
RUN mkdir -p /data/web/public

ADD vncserver.sh vncserver.sh
RUN chmod +x /vncserver.sh

ADD start.rb start.rb
RUN chmod +x /start.rb

ADD start.sh start.sh
RUN chmod +x /start.sh

# for cache!
RUN apt-get -y install libmagickwand-dev
ADD Gemfile /data/crawler/Gemfile
ADD Gemfile.lock /data/crawler/Gemfile.lock
RUN cd /data/crawler && bundle -j4 --without test

ADD chrome-shot.rb chrome-shot.rb
RUN chmod +x /chrome-shot.rb

ADD . /data/crawler
# confirm bundle

CMD ["/start.sh"]
