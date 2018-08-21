FROM ruby:2.4-alpine3.6

WORKDIR /home/app

COPY Gemfile    		.
COPY index.rb           .

RUN bundle install \
  && mkdir -p /home/app/views

COPY views/index.erb /home/app/views
COPY views/signed.erb /home/app/views

RUN addgroup -S app \
  && adduser app -S -G app

RUN chown app:app -R /home/app

WORKDIR /home/app

RUN touch /tmp/.lock

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1

CMD ["ruby", "index.rb"]
