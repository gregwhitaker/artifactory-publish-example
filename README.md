# artifactory-publish-example
[![Build Status](https://travis-ci.org/gregwhitaker/artifactory-publish-example.svg?branch=master)](https://travis-ci.org/gregwhitaker/artifactory-publish-example)

An example of deploying artifacts of a multi-module Gradle project to Artifactory.

This repo provides examples for using both the [Artifactory Plugin](https://www.jfrog.com/confluence/display/RTF/Gradle+Artifactory+Plugin) as well as using the older
[Maven Publish Plugin](https://docs.gradle.org/current/userguide/publishing_maven.html).

## Prerequisites
This example requires a running Artifactory instance. If you do not already have one, start a dockerized version using these [instructions](https://www.jfrog.com/confluence/display/RTF/Installing+with+Docker).

## Running the Example
Follow the steps below to deploy the artifacts to your running Artifactory instance:

1. Set the following Gradle properties:

    These properties can be set as `-P` parameters or passed in via `gradle.properties` or `gradle-local.properties`.
    
    * `artifactoryBaseUrl` - Url of Artifactory (http://artifactory.mydomain.com)
    * `artifactoryUsername` - Username of Artifactory deployer
    * `artifactoryPassword` - Password of Artifactory deployer
    
    If setting these properties via environment variables you need to use the following variable names:
    
    * `ORG_GRADLE_PROJECT_artifactoryBaseUrl`
    * `ORG_GRADLE_PROJECT_artifactoryUsername`
    * `ORG_GRADLE_PROJECT_artifactoryPassword`
    
2. Run the following command to deploy the artifacts to Artifactory using the `com.jfrog.artifactory` plugin:

        ./gradlew clean build artifactoryPublish
        
    If you wish to switch to using the `maven-publish` plugin the command to publish artifacts is:
    
        ./gradlew clean build publish

## Bugs and Feedback
For bugs, questions, and discussions please use the [Github Issues](https://github.com/gregwhitaker/artifactory-publish-example/issues).

## License
MIT License

Copyright (c) 2018 Greg Whitaker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.