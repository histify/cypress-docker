FROM cypress/included:12.17.4

RUN set -eux; \
    apt-get update && apt-get install -y --no-install-recommends \
    curl \
    locales \
    gosu \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i '/de_CH.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

WORKDIR /app

RUN npm install \
    @4tw/cypress-drag-drop \
    @testing-library/cypress \
    cypress-file-upload \
    cypress-network-idle \
    axios \
    luxon \
    cypress-axe \
    axe-core

RUN addgroup --system cypress \
    && adduser --system --ingroup cypress cypress \
    && mkdir -p /app/test

WORKDIR /app/test

RUN echo 'LC_ALL=de_CH.UTF-8' | tee -a /etc/environment
ENV LANG=de_CH.UTF-8
ENV LC_ALL=de_CH.UTF-8
ENV CYPRESS_CI=1
ENV TZ=Europe/Zurich

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
