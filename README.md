# cypress docker image

This image has the [cypress/included](https://hub.docker.com/r/cypress/included) image as a base.

It installs additional testing libraries:
- @4tw/cypress-drag-drop
- @testing-library/cypress
- cypress-file-upload
- axios
- luxon

Your also have an env variable named `CYPRESS_CI` set to `1`.

## entrypoint

The entrypoint is set to `cypress run -q`. The `-q` is useful to have less clutter on the CI in the output.


## Cypress Dashboard

Example `docker-compose.yml` for using Cypress Dashboard for storing
recordings.

```yml
services:
  cypress:
    image: 4teamwork/cypress
    environment:
      - CYPRESS_baseUrl=http://external-frontend:80
      - NO_COLOR=1
      - TERM=dumb
      - CYPRESS_RECORD_KEY=XXXX
      - CYPRESS_PROJECT_ID=XXXX
      - CYPRESS_VIDEO=true
      - COMMIT_INFO_MESSAGE
      - COMMIT_INFO_REMOTE
      - COMMIT_INFO_BRANCH
      - COMMIT_INFO_SHA
      - COMMIT_INFO_AUTHOR
      - COMMIT_INFO_EMAIL
```

When `CYPRESS_RECORD_KEY` is not empty, cypress will be started with the `--record` option.
