FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /pantry-api
WORKDIR /pantry-api
COPY Gemfile /pantry-api/Gemfile
COPY Gemfile.lock /pantry-api/Gemfile.lock
RUN gem install bundler -v 2.1.4
RUN bundle install
COPY . /pantry-api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]