#!/usr/bin/env bash
# This script will build the project.

echo -e "TRAVIS_BRANCH=$TRAVIS_BRANCH"
echo -e "TRAVIS_TAG=$TRAVIS_TAG"
echo -e "TRAVIS_COMMIT=${TRAVIS_COMMIT::7}"
echo -e "TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST"

# Builds a feature branch
function build_feature() {
    echo -e 'Build Branch => Branch ['$TRAVIS_BRANCH']'
    ./gradlew -PversionQualifier=$TRAVIS_COMMIT clean build publish --stacktrace
}

# Builds a pull request
function build_pr() {
    echo -e "Build Pull Request #$TRAVIS_PULL_REQUEST => Branch [$TRAVIS_BRANCH]"
    ./gradlew -PversionQualifier=PR-$TRAVIS_PULL_REQUEST clean build --stacktrace
}

# Builds the development branch
function build_develop() {
    echo -e 'Build Development Branch (Snapshot) => Branch ['$TRAVIS_BRANCH']'
    ./gradlew -PversionQualifier=SNAPSHOT clean build publish --stacktrace
}

# Builds the release candidate branches
function build_rc() {
    echo -e 'Build Release Branch (RC) => Branch ['$TRAVIS_BRANCH']'
    ./gradlew -PversionQualifier=RC clean build publish --stacktrace
}

# Builds the master branch
function build_master() {
    ./gradlew clean build publish --stacktrace
}

# Builds a hotfix branch
function build_hotfix() {
    ./gradlew -PversionQualifier=HOTFIX clean build publish --stacktrace
}