FROM ruby:3.0.0-buster

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs
RUN apt-get update && apt-get install -y sqlite3 
RUN gem install rails -v 6.1
RUN npm install --global yarn@1.22
