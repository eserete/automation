FROM eserete/ruby-selenium:1.0.0

RUN gem update
ADD Gemfile .
RUN bundle install

ADD features ./features

CMD ["cucumber", "--tags", "@wip", "features/login.feature"]
