# cypress docker image

This image has the [cypress/included](https://hub.docker.com/r/cypress/included) image as a base.

It installs additional testing libraries:
- @4tw/cypress-drag-drop
- @testing-library/cypress
- cypress-file-upload
- axios

Your also have an env variable named `CYPRESS_CI` set to `1`.

## entrypoint

The entrypoint is set to `cypress run -q`. The `-q` is useful to have less clutter on the CI in the output.
