FROM ruby:3.0.1-alpine3.12

ENV APP_ROOT /app
WORKDIR ${APP_ROOT}

#RUN echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
RUN apk update && \
    apk add tzdata postgresql-client nodejs libxml2-dev curl-dev make gcc libc-dev g++ postgresql-dev && \
    rm -rf /var/cache/apk/*

ENV PATH $PATH:/usr/local/lib/nodejs/node-v14.16.0-linux-x64/bin
#RUN npm install -g yarn

COPY ./Gemfile ${APP_ROOT}
COPY ./Gemfile.lock ${APP_ROOT}

# gemインストールの高速化
#   gem: --nodocument, --global jobs 4
RUN echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    bundle config --global jobs 4 && \
    bundle config set without 'test development' && \
    bundle install

COPY . ${APP_ROOT}/

EXPOSE 8080

CMD ["/bin/sh", "-c", "while :; do sleep 10; done"]
