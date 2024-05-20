ARG RUBY_VERSION=ruby:3.3.0
ARG NODE_VERSION=19
FROM $RUBY_VERSION
ARG RUBY_VERSION
ARG NODE_VERSION
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV RAILS_ENV=production
# Node.jsの新しいインストール方法を使用
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
&& curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential nodejs yarn libpq-dev
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY yarn.lock /app/yarn.lock
RUN bundle install
RUN yarn install
COPY . /app

# COPY start.sh /start.sh
# RUN chmod 744 /start.sh
# CMD ["sh", "/start.sh"]
