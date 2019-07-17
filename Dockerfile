FROM ruby:2.6.3-alpine

WORKDIR /app

RUN addgroup \
    -g 1000 \
    -S app \
  && adduser \
    -u 1000 \
    -S app \
    -G app
USER app

COPY Gemfile* ./
RUN bundle install \
      --jobs "$(getconf _NPROCESSORS_ONLN)" \
      --retry 5 \
    && rm -rf /home/app/.bundle

COPY --chown=app:app . /app

EXPOSE 4567
CMD ["ruby", "app.rb"]
