# Control Tower Docker Image

[![](https://img.shields.io/docker/pulls/cnservices/control-tower.svg)](https://hub.docker.com/r/cnservices/control-tower/)
[![](hhttps://img.shields.io/docker/build/cnservices/control-tower)](https://hub.docker.com/r/cnservices/control-tower/)
[![](https://img.shields.io/docker/automated/cnservices/control-tower)](https://hub.docker.com/r/cnservices/control-tower/)
[![](https://img.shields.io/docker/stars/cnservices/control-tower)](https://hub.docker.com/r/cnservices/control-tower/)
[![](https://img.shields.io/github/license/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/issues/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/issues-closed/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/languages/code-size/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)
[![](https://img.shields.io/github/repo-size/cn-cicd/control-tower)](https://github.com/cn-cicd/control-tower)

## Control Tower for AWS

If you want to run control-tower with it's own IAM account, create a user with the following permissions:
- AmazonRDSFullAccess
- AmazonEC2FullAccess
- IAMFullAccess
- AmazonS3FullAccess
- AmazonVPCFullAccess
- AmazonRoute53FullAccess
- IAMUserSSHKeys

Run the container

        docker run --tty --interactive --env AWS_ACCESS_KEY_ID='<YOUR_AWS_ACCESS_KEY>' --env AWS_SECRET_ACCESS_KEY='<YOUR_AWS_SECRET_KEY>' --name control-tower cnservices/control-tower bash

## Control Tower for GCP

On GCP you must also ensure the following APIs are activated in your project:
- Compute Engine API (gcloud services enable compute.googleapis.com)
- Identity and Access Management (IAM) API (gcloud services enable iam.googleapis.com)
- Cloud Resource Manager API (gcloud services enable cloudresourcemanager.googleapis.com)
- SQL Admin API (gcloud services enable sqladmin.googleapis.com)

If using a dedicated GCP IAM member, a IAM Primitive role of roles/owner for the target GCP Project is required.

Run the container:

        docker run --tty --interactive --volume $(GCP_KEY_FILE_PATH):/tmp/ --env GOOGLE_APPLICATION_CREDENTIALS=/tmp/$(GCP_KEY_FILE_NAME) cnservices/control-tower bash

## Available commands

After running the docker container, you will prompted to the container environment shell where you can run the following Control Tower commands:

- **deploy**: Deploys or updates a Concourse ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/deploy.md))
- **destroy**: Destroys a Concourse ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/destroy.md))
- **info**: Fetches information on a deployed environment ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/info.md))
- **maintain**: Handles maintenance operations in control-tower ([Documentation](https://github.com/EngineerBetter/control-tower/blob/master/docs/maintain.md))
- **help**: Get help for commands

More information [here](https://github.com/EngineerBetter/control-tower)
