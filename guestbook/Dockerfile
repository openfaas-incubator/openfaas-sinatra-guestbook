FROM ruby:2.4-alpine3.6
WORKDIR /home/app

RUN mkdir -p /home/app/views

COPY Gemfile    .

RUN apk add --no-cache mysql-dev make build-base git \
  && bundle install \
  && apk del make build-base git

COPY index.rb   .
COPY views      views

RUN addgroup -S app \
  && adduser app -S -G app

RUN chown app:app -R /home/app

WORKDIR /home/app

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1

# USER app

CMD ["ruby", "index.rb"]
