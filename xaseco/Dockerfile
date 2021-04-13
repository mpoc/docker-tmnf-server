FROM php:5.6-alpine
WORKDIR /xaseco
COPY xaseco_116.zip .
# According to https://www.gamers.org/tmf/quickstart.html
# Database updating by https://medium.com/@Jonese1234/how-to-set-up-a-dedicated-trackmania-server-with-xaseco-records-eyepiece-d8a44dbf528e
RUN docker-php-ext-install mysql      && \
    apk add --no-cache unzip          && \
    unzip xaseco_116.zip -d /         && \
    rm xaseco_116.zip                 && \
    mv ./newinstall/*.xml ./          && \
    mv ./newinstall/*.php ./includes/ && \
    sed -i "s/`UpdatedAt` datetime NOT NULL default '0000-00-00 00:00:00'/`UpdatedAt` datetime NOT NULL default CURRENT_TIMESTAMP/g" ./plugins/plugin.localdatabase.php && \
    sed -i "s/`Date` datetime NOT NULL default '0000-00-00 00:00:00'/`Date` datetime NOT NULL default CURRENT_TIMESTAMP/g" ./plugins/plugin.localdatabase.php

ENTRYPOINT ["php", "aseco.php", "TMF"]
