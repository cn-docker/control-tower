# Control Tower Docker Image

[![](https://img.shields.io/docker/pulls/jnonino/control-tower.svg)](https://hub.docker.com/r/jnonino/control-tower/)
[![](hhttps://img.shields.io/docker/build/jnonino/control-tower)](https://hub.docker.com/r/jnonino/control-tower/)
[![](https://img.shields.io/docker/automated/jnonino/control-tower)](https://hub.docker.com/r/jnonino/control-tower/)
[![](https://img.shields.io/docker/stars/jnonino/control-tower)](https://hub.docker.com/r/jnonino/control-tower/)
[![](https://img.shields.io/github/license/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/issues/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/issues-closed/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/languages/code-size/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/repo-size/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)

## How to use Control Tower

Run the container

AWS:

        docker run --tty --interactive --env AWS_ACCESS_KEY_ID='<YOUR_AWS_ACCESS_KEY>' --env AWS_SECRET_ACCESS_KEY='<YOUR_AWS_SECRET_KEY>' --name control-tower jnonino/control-tower bash

GCP:

        docker run --tty --interactive --env GOOGLE_APPLICATION_CREDENTIALS=<PATH_TO_GOOGLE_CREDS_JSON> --name control-tower jnonino/control-tower bash

After running that command you will prompted to the container environment, you can run the following Control Tower commands:

- **deploy**: Deploys or updates a Concourse ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/deploy.md))
- **destroy**: Destroys a Concourse ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/destroy.md))
- **info**: Fetches information on a deployed environment ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/info.md))
- **maintain**: Handles maintenance operations in control-tower ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/maintain.md))
- **help**: Get help for commands

More information [here](https://github.com/EngineerBetter/control-tower)
