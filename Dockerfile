FROM hitalos/php:latest

LABEL "com.github.actions.name"="Laravel PHPUnit"
LABEL "com.github.actions.description"="A GitHub action to run your Laravel project's PHPUnit test suite."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/nathanheffley/laravel-phpunit-action"
LABEL "homepage"="https://github.com/nathanheffley/laravel-phpunit-action"
LABEL "maintainer"="Nathan Heffley <nathan@nathanheffley.com>"

# install Additional Dependencies (linke PHP Extensions)
ADD install-dependencies.sh /install-dependencies.sh
RUN chmod +x /install-dependencies.sh
RUN /usr/sbin/install-dependencies.sh

# Download and install NodeJS
ADD install-node.sh /install-node.sh
UN chmod +x /install-node.sh
RUN /usr/sbin/install-node.sh

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
