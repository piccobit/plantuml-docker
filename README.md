# plantuml-docker

Heavily inspired by the [original Docker image](https://github.com/plantuml/plantuml-server), this Docker image will run a plantUML server for you.

## How to build

    docker build --tag plantuml-server .

## How to run

    docker run -d -p 8080:8080 plantuml-server
    
The plantuml-server is now listening on port 8080 and available using the following URL:

    http://localhost:8080/
    
## How to configure

Setting the environment variable `JETTY_CONTEXTPATH` allows you to add a prefix to the URL.

### Example

    docker run -d -p 8080:8080 -e JETTY_CONTEXTPATH=/plantuml plantuml-server

The plantuml-server is now listening on port 8080 and available using the following URL:

    http://localhost:8080/plantuml

## How to use

The [plantuml-server description](http://plantuml.com/de/server) provides a detailled explanation how to use the plantuml-server.

## How to serve plantuml images for GitHub

The [examples](examples) folder contains an example showing you how to use the plantuml-server to provide images for your GitHub Markdown files.
