FROM ruby

COPY . /code
WORKDIR /code
RUN apt-get update && apt-get install -y nodejs && apt-get clean
RUN bundle install
EXPOSE 3000
CMD rails server -e production
