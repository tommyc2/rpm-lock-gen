#!/bin/bash

# This script builds the Docker image for the RPM lockfile tool environment.

# Enter your details below to configure the build.

BASE_IMAGE="e.g. registry.access.redhat.com/ubi9/ubi:latest"
ACTIVATION_KEY="<insert_here>"
ORG_ID="<insert_here>"
SKOPEO_USERNAME="<insert_here>"
SKOPEO_PASSWORD="<insert_here>"

podman build \
  --build-arg BASE_IMAGE=$BASE_IMAGE \
  --build-arg ACTIVATION_KEY=$ACTIVATION_KEY \
  --build-arg ORG_ID=$ORG_ID \
  --build-arg SKOPEO_USERNAME=$SKOPEO_USERNAME \
  --build-arg SKOPEO_PASSWORD=$SKOPEO_PASSWORD \
  -f Containerfile.rpm-lockfile-gen \
  -t rpm-lockfile-tool-environment:latest .

podman run -it --rm -v $(pwd):/source rpm-lockfile-tool-environment:latest