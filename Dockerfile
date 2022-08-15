FROM cypress/included:10.3.1

WORKDIR /app
RUN npm install @4tw/cypress-drag-drop @testing-library/cypress cypress-file-upload axios luxon

RUN addgroup --system cypress \
    && adduser --system --ingroup cypress cypress

ENV CYPRESS_CI=1
ENV LC_ALL="de_CH.UTF-8"
ENV TZ=Europe/Zurich

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
