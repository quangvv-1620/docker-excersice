FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /myapp

ENV APP_PATH /myapp

WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
