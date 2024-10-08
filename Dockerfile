#FROM ruby:3.2.2
#WORKDIR /app
#RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
#RUN apt-get update -y
#RUN apt-get install -y nodejs
#RUN npm install -g yarn

FROM ruby:3.2.2
WORKDIR /app
RUN apt-get update && apt-get install -y curl gnupg2 && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs postgresql-client git && \
    npm install -g yarn

COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rails -v 6.1.4.4 install && \
    git config --global init.defaultBranch main && \
    git config --global init.defaultBranch