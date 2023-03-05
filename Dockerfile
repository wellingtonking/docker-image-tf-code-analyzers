FROM alpine:3.17

RUN apk update && apk add curl bash git openssl jq

## Install Snyk ##
RUN curl https://static.snyk.io/cli/latest/snyk-alpine -o snyk && \
  chmod +x snyk && \
  mv ./snyk /usr/local/bin/

## Install tfsec ##
RUN apk add coreutils
RUN curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash

## Install regula ##
RUN cd /tmp && curl -LO https://github.com/fugue/regula/releases/download/v3.2.1/regula_3.2.1_Linux_x86_64.tar.gz && \
  tar -xzvf regula_3.2.1_Linux_x86_64.tar.gz && \
  mv regula /usr/local/bin/

## Install tflint ##
RUN cd /tmp && curl -LO https://github.com/terraform-linters/tflint/releases/download/v0.45.0/tflint_linux_amd64.zip && \
  unzip tflint_linux_amd64.zip && \
  mv tflint /usr/local/bin/

## Reduce image size ##
RUN rm -vrf /var/cache/apk/* && rm -vrf /tmp/* && apk del coreutils

CMD ["/bin/bash"]