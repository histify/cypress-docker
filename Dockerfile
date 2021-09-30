FROM cypress/included:8.5.0
RUN npm install @4tw/cypress-drag-drop @testing-library/cypress cypress-file-upload axios
ENV CYPRESS_CI=1
ENTRYPOINT ["cypress", "run", "-q"]
