FROM howardhe/maven_git:0.1
MAINTAINER Howard He "howard.he0329@gmail.com"

ENV VERSION=2.1.2
ENV JOB_CONSOLE=/elastic-job-console

RUN git clone https://github.com/dangdangdotcom/elastic-job.git \
    && cd elastic-job \
    && git checkout -b ${VERSION} ${VERSION} \
    && mvn install -DskipTests=true \
    && cd elastic-job-lite/elastic-job-lite-console/target/ \
    && tar zxvf elastic-job-lite-console-${VERSION}.tar.gz  \
    && mv elastic-job-lite-console-${VERSION} ${JOB_CONSOLE}

EXPOSE 8080

WORKDIR ${JOB_CONSOLE}

ENTRYPOINT ["bin/start.sh"]


