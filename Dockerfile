FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install \
    curl \
    expect \
    jq \
    -y

RUN mkdir actions-runner && cd actions-runner && \
    curl -o actions-runner-linux-x64-2.299.1.tar.gz -L \
    https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.299.1.tar.gz && \
    ./bin/installdependencies.sh

COPY exec-runner.sh /actions-runner/exec-runner.sh
RUN chmod +x /actions-runner/exec-runner.sh
WORKDIR /actions-runner

CMD ["/actions-runner/exec-runner.sh"]