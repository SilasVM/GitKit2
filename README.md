# GitKit-Refactor

Experimental refactoring of GitKit.

## Deploy

1. On GitHub, create a personal access token with the following scopes
   * repo (all)
   * read:org
   * workflow

2. Run the following replacing `<token>` with the token you just created,
   and `<org>` with the GitHub organization (or username) to deploy into.

      ```bash
      docker run --rm -it -e GH_TOKEN=<token> ghcr.io/hfossedu/gitkit-deploy <org>
      ```
