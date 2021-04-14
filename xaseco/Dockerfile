FROM php:5.6-alpine
WORKDIR /xaseco
COPY xaseco_116.zip .
COPY records_eyepiece(1.1.1).zip .
# According to https://www.gamers.org/tmf/quickstart.html
RUN docker-php-ext-install mysql      && \
    apk add --no-cache unzip          && \
    unzip xaseco_116.zip -d /         && \
    rm xaseco_116.zip                 && \
    mv ./newinstall/*.xml ./          && \
    mv ./newinstall/*.php ./includes/ && \
# Database updating by https://medium.com/@Jonese1234/how-to-set-up-a-dedicated-trackmania-server-with-xaseco-records-eyepiece-d8a44dbf528e
    sed -i "s/`UpdatedAt` datetime NOT NULL default '0000-00-00 00:00:00'/`UpdatedAt` datetime NOT NULL default CURRENT_TIMESTAMP/g" ./plugins/plugin.localdatabase.php && \
    sed -i "s/`Date` datetime NOT NULL default '0000-00-00 00:00:00'/`Date` datetime NOT NULL default CURRENT_TIMESTAMP/g" ./plugins/plugin.localdatabase.php           && \
# Installing plugins
    sed -i '/^<\/aseco_plugins>/i<!--    Custom plugins below -->' plugins.xml                 && \
# Installing records-eyepiece
# https://plugins.xaseco.org/info.php?id=68
    unzip records_eyepiece\(1.1.1\).zip plugins/plugin.records_eyepiece.php                    && \
    unzip records_eyepiece\(1.1.1\).zip records_eyepiece.xml                                   && \
    unzip records_eyepiece\(1.1.1\).zip placement_examples.xml                                 && \
    rm records_eyepiece\(1.1.1\).zip                                                           && \
    sed -i '/^<\/aseco_plugins>/i\\t<plugin>plugin.records_eyepiece.php<\/plugin>' plugins.xml && \
# Uncomment donate plugin because it is a dependency of records-eyepiece
    sed -i 's/<!--	<plugin>plugin.donate.php<\/plugin> -->/\t<plugin>plugin.donate.php<\/plugin>/g' plugins.xml

ENTRYPOINT ["php", "aseco.php", "TMF"]
