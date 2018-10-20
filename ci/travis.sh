#!/usr/bin/env bash
# This script will build the project.

# Builds and Publishes a SNAPSHOT
function build_snapshot() {
    echo -e "Building Snapshot => Branch [$TRAVIS_BRANCH]"
    ./gradlew -PversionQualifier=SNAPSHOT clean build artifactoryPublish --stacktrace
}

# Builds a Pull Request
function build_pullrequest() {
    echo -e "Building Pull Request #$TRAVIS_PULL_REQUEST => Branch [$TRAVIS_BRANCH]"
    ./gradlew clean build
}

# Builds and Publishes a Tag
function build_tag() {
    echo -e "Building Tag => Branch [$TRAVIS_BRANCH], Tag [$TRAVIS_TAG]"
    ./gradlew clean build artifactoryPublish --stacktrace
}

echo -e "TRAVIS_BRANCH=$TRAVIS_BRANCH"
echo -e "TRAVIS_TAG=$TRAVIS_TAG"
echo -e "TRAVIS_COMMIT=${TRAVIS_COMMIT::7}"
echo -e "TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST"

# Build Logic
if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    build_pullrequest
elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ]; then
    build_snapshot
elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ]; then
    build_tag
else
    echo -e "WARN: Should Not Be Here => Branch [$TRAVIS_BRANCH], Tag [$TRAVIS_TAG], Pull Request [#$TRAVIS_PULL_REQUEST]"
    ./gradlew clean build
fi
