# docker-jenkins

Sets up a container with jenkins and docker installed, listening on
port 8080. You then run all your tests inside another docker image - this
way you don't need to install any build dependencies on your jenkins system.

## Usage

To run the container, do the following:

    docker run -privileged -d -p 8000:8080 agrafix/jenkins-docker
    
    docker ps
    CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                     NAMES
    b9ebe2581792        agrafix/jenkins-docker:latest   java -jar /opt/jenki   Less than a second ago   Up 1 seconds        0.0.0.0:8000->8080/tcp   angry_mayer

Your jenkins instance is now available by going to http://localhost:8000 .

To build a haskell project for example, a possible build script could be:

    docker run agrafix/ghc7.6 /bin/bash -c 'git clone
    http://github.com/agrafix/funblog && cd funblog && cabal install'

## Building

To build the image, simply invoke

    docker build github.com/agrafix/docker-jenkins

A prebuilt container is also available in the docker index

    docker pull agrafix/jenkins-docker


## Author

  * Alexander Thiemann
  * Allan Espinosa (<allan.espinosa@outlook.com>)
  * Gwenn Etourneau

## LICENSE

Copyright 2013 Allan Espinosa

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
