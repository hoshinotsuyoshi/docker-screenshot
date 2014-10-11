FROM hoshinotsuyoshi/vncserver:ruby2-1-2

# for cache!
RUN apt-get -y install libmagickwand-dev
RUN mkdir -p /data/crawler
ADD Gemfile /data/crawler/Gemfile
ADD Gemfile.lock /data/crawler/Gemfile.lock
WORKDIR /data/crawler
RUN bundle -j4 --without test

RUN mkdir -p /data/web/public

ADD vncserver.sh /vncserver.sh
#RUN chmod +x /vncserver.sh

ADD start.rb /start.rb
#RUN chmod +x /start.rb

ADD start.sh /start.sh
#RUN chmod +x /start.sh

ADD chrome-shot.rb /chrome-shot.rb
#RUN chmod +x /chrome-shot.rb

#ADD . /data/crawler
# confirm bundle

CMD ["/start.sh"]
