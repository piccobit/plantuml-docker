FROM openjdk:8-jdk

MAINTAINER HD Stich <hd@kubernetes.zone>

RUN apt-get update && apt-get install -y --no-install-recommends graphviz && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 plantuml \
    && useradd -N -M -d /home/plantuml -g plantuml -u 1000 plantuml \
    && mkdir -p /home/plantuml \
    && chown plantuml:plantuml /home/plantuml

ARG JETTY_RUNNER_URL=https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-runner
ARG JETTY_RUNNER_VERSION=9.4.9.v20180320

ARG PLANTUML_URL=https://downloads.sourceforge.net/project/plantuml/plantuml.war

ENV JETTY_CONTEXTPATH=/

WORKDIR /home/plantuml

RUN curl -LsS -o /opt/jetty-runner.jar ${JETTY_RUNNER_URL}/${JETTY_RUNNER_VERSION}/jetty-runner-${JETTY_RUNNER_VERSION}.jar
RUN curl -LsS -o plantuml.war ${PLANTUML_URL}

EXPOSE 8080

CMD java -jar jetty-runner.jar --path ${JETTY_CONTEXTPATH} plantuml.war

# To run with debugging enabled instead
# CMD java -Dorg.eclipse.jetty.util.log.class=org.eclipse.jetty.util.log.StdErrLog -Dorg.eclipse.jetty.LEVEL=DEBUG -jar jetty-runner.jar --path ${JETTY_CONTEXTPATH} plantuml.war
