FROM rubylang/ruby:master-nightly-bionic

WORKDIR /home/ubuntu/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
USER ubuntu
COPY . ./
EXPOSE 9292
CMD bundle exec rackup --server puma --port 9292 --host 0.0.0.0
