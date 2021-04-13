FROM php:5.6-alpine
WORKDIR /xaseco
COPY xaseco_116.zip .
# According to https://www.gamers.org/tmf/quickstart.html
RUN docker-php-ext-install mysql      && \
    apk add --no-cache unzip          && \
    unzip xaseco_116.zip -d /         && \
    rm xaseco_116.zip                 && \
    mv ./newinstall/*.xml ./          && \
    mv ./newinstall/*.php ./includes/

ENTRYPOINT ["php", "aseco.php", "TMF"]
