# Deploying the GitKit

**Note: This version allows deployment to either GitHub or GitLab - WORK-IN-PROGRESS - not yet working.**

This section documents a more detailed, more manual deployment process.
This may be useful to someone who needs more flexibility than that given
in [README.md](../README.md).

## Overview

To use the GitKit faculty must deploy it. Deploying the GitKit creates a repository that students use as the upstream repository for the hands-on GitKit activities.  This repository contains the code, documentation and history from the FarmData2 project and has an issue tracker that is populated with the tickets used in the activities. It is also configured to interact with the KitClient to install the Kit-tty and to provide community automations.

**Important Note:** Each deployment supports up to 32 students. If you have more than 32 students you will need to perform multiple deploys and direct sub-sets of students to each upstream repository.

## Deploy Requirements

* [GitHub](https://github.com/) - A free account is sufficient.
* A machine with Docker installed and running. There are two options:
  * [GitPod](https://gitpod.io/) - A free account is sufficient.
    Provides remote workspaces that are preinstalled with and run Docker.
    For example, opening this project in a GitPod workspace will give you
    such an environment.
  * [Docker](https://www.docker.com/) - Install and run Docker on your machine.

The deployer will likely run faster in GitPod than on your personal
machine depending on your network context.

### Deploy the Upstream Repository to GitHub

In a machine running Docker, open a terminal and run the command below

```bash
docker run --rm -it -e GH_TOKEN=<token> -e REPO_NAME=<repo> registry.gitlab.com/hfossedu/kits/gitkit:latest <org>
```

with the following substitutions:

* `<org>`: Either your personal namespace or an organization that you have created or have permissions to create repositories within.
* `<repo>`: The name for the new repository (your choice).
* `<token>`: A (classic) personal access token. To get one, navigate to
    <https://github.com/settings/tokens/new> and generate one with the
    following scopes:
    * repo (all)
    * workflow
    * read:org (under admin:org)

#### Example

Suppose you want to deploy GitKit into an organization named `mycourse2024`
that you created for your course. And you want the new repository named
`GitKit-FarmData2`. You navigate to <https://github.com/settings/tokens/new>
and generate an appropriate token and copy it. The you open a terminal
and run the following:

```bash
docker run --rm -it -e GH_TOKEN=ghp_QWERTYasdf1234POIUljhxcvb -e REPO_NAME=GitKit-FarmData2 registry.gitlab.com/hfossedu/kits/gitkit:latest mycourse2024
```

### Configure the Upstream Repository

To enable the community automations, you need to ensure that "Workflow permissions"
for the new repository grant the `GITHUB_TOKEN` the "Read and write permissions".

Where you set these permissions depends on whether you deployed into your personal namespace or an organization.

* If you deployed to an **organization**, navigate to that organization page
  on GitHub.
* If you deployed into your **personal namespace**, navigate to the new repository
  on GitHub.

Now that you are on the correct page, do the following.

1. Open the "Settings" (the "gear" icon top right)
2. Select "Actions" -> "General" in the left-hand menu.
3. Click "Read and write permissions" in the "Workflow Permissions" section.

### Deploy the Upstream Repository to GitLab

In a machine running Docker, open a terminal and run the command below

```bash
docker run --rm -it -e GH_TOKEN=<token> -e REPO_NAME=<repo> registry.gitlab.com/hfossedu/kits/gitkit:latest <group>
```

with the following substitutions:

* `<group>`: A GitLab group or subgroup that you have created or have permissions to create repositories within.
* `<repo>`: The name for the new repository (your choice).
<!--* `<token>`: A (classic) personal access token. To get one, navigate to
    <https://github.com/settings/tokens/new> and generate one with the
    following scopes:
    * repo (all)
    * workflow
    * read:org (under admin:org)-->

#### Example

Suppose you want to deploy GitKit into a group named `mycourse2024`
that you created for your course. And you want the new repository named
`GitKit-FarmData2`. 
<!--You navigate to <https://github.com/settings/tokens/new>
and generate an appropriate token and copy it. The you open a terminal
and run the following:

```bash
docker run --rm -it -e GH_TOKEN=ghp_QWERTYasdf1234POIUljhxcvb -e REPO_NAME=GitKit-FarmData2 registry.gitlab.com/hfossedu/kits/gitkit:latest mycourse2024
```
-->
### Configure the Upstream Repository

<!--To enable the community automations, you need to ensure that "Workflow permissions"
for the new repository grant the `GITHUB_TOKEN` the "Read and write permissions".

Where you set these permissions depends on whether you deployed into your personal namespace or an organization.

* If you deployed to an **organization**, navigate to that organization page
  on GitHub.
* If you deployed into your **personal namespace**, navigate to the new repository
  on GitHub.

Now that you are on the correct page, do the following.

1. Open the "Settings" (the "gear" icon top right)
2. Select "Actions" -> "General" in the left-hand menu.
3. Click "Read and write permissions" in the "Workflow Permissions" section.-->