FROM ubuntu:22.04

### Install the following dependenices in the docker image
# 
# curl iproute2 sshfs unzip less groff 
# Install kubectl from https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl
#
# Install AWS CLI from https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
# 
# Install the above tools, unpack and make it available in the PATH executable
###

# Install dependencies using apt-get
RUN apt-get update && apt-get install -y \
    curl \
    iproute2 \
    sshfs \
    unzip \
    less \
    groff

# Download and install kubectl
RUN curl -LO "https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Download and install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws

# Set the PATH to include kubectl and AWS CLI
ENV PATH="/usr/local/bin:${PATH}"

# Set the entrypoint to a shell, e.g., bash
ENTRYPOINT ["/bin/bash"]
