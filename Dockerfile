FROM cypress/included:8.5.0

RUN npm install @4tw/cypress-drag-drop @testing-library/cypress cypress-file-upload axios luxon

ENV CYPRESS_CI=1
ENV LC_ALL="de_CH.UTF-8"
ENV TZ=Europe/Zurich

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
