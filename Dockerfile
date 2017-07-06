FROM ruby:2.4

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' 9.6 > /etc/apt/sources.list.d/pgdg.list; \
   wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
    build-essential locales \
    # for postgres
    libpq-dev postgresql-client \
    # for a JS runtime
    nodejs yarn \
&& rm -rf /var/lib/apt/lists/*

RUN localedef -i pl_PL -c -f UTF-8 -A /usr/share/locale/locale.alias pl_PL.UTF-8
ENV LANG pl_PL.utf8

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME


ARG RAILS_ENV=development
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
