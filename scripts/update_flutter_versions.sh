#!/bin/bash
set -e

# This script fetches the latest versions of the stable and beta Flutter channels
# and edits the GitHub Actions publish workflow with those versions.

releases_json=$(curl -s https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json)

# This function edits the publish workflow with the given Flutter version for the given Docker tag.
edit_publish_workflow_for_tag() {
    publish_workflow=".github/workflows/publish.yml"
    docker_tag=$1
    version=$2

    # env for yq
    docker_tag=$docker_tag version=$version \
        yq -i '(.jobs.publish.strategy.matrix.image[] | select(.DOCKER_TAG == env(docker_tag)) | .FLUTTER_VERSION) = env(version)' $publish_workflow
}

# This function fetches the latest version of a particular channel (stable, beta) for Flutter
get_latest_version_in_channel() {
    channel=$1
    # This contains the hash of the latest version in the channel
    channel_hash=$(echo "$releases_json" | jq -r '.current_release.'"$channel")
    # Look for the version corresponding to the hash in the list of releases
    version=$(echo "$releases_json" | jq -r --arg HASH "$channel_hash" \
        '.releases[] | select(.hash == $HASH).version')

    # check not empty
    if [ -z "$version" ]; then
        echo "Error fetching latest version in channel $channel"
        exit 1
    fi

    echo "$version"
}

stable_version=$(get_latest_version_in_channel "stable")
beta_version=$(get_latest_version_in_channel "beta")

echo "Latest beta version: $beta_version"
echo "Latest stable version: $stable_version"

edit_publish_workflow_for_tag "stable" "$stable_version"
edit_publish_workflow_for_tag "latest" "$stable_version"
edit_publish_workflow_for_tag "beta" "$beta_version"

exit 0
