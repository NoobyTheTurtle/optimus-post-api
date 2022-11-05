FROM ruby:3.1.2

ENV APP_HOME /app

# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
      # Needed for certain gems
    build-essential \
         # Needed for postgres gem
    libpq-dev \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log
# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# Add our Gemfile and install gems
ADD Gemfile* $APP_HOME/
RUN gem update --system && \
    gem update bundler && \
    bundle check || bundle install --jobs 4 --retry 5
# Copy over our application code
ADD . $APP_HOME

# Run our app
CMD RAILS_ENV=${RAILS_ENV} rm -rf ./tmp/pids/server.pid && bundle exec rails s -p ${APP_PORT} -b '0.0.0.0'
