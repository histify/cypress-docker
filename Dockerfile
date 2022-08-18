FROM cypress/included:10.3.1

RUN apt-get -y install gosu locales && \
    sed -i '/de_CH.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

WORKDIR /app
RUN npm install @4tw/cypress-drag-drop @testing-library/cypress cypress-file-upload axios luxon

RUN addgroup --system cypress \
    && adduser --system --ingroup cypress cypress
RUN mkdir -p /app/test

ENV CYPRESS_CI=1
ENV LC_ALL="de_CH.UTF-8"
ENV TZ=Europe/Zurich

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
