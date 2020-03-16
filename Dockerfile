ARG BASE=debian
FROM $BASE

ARG kubectl_version=1.15.0
ARG helm_version=2.14.3
ARG kind_version=0.5.1
ARG kudo_version=0.10.0

RUN apt-get update && apt-get install -y curl jq && rm -rf /var/lib/apt/lists/* && \
    curl -Lf -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v$kubectl_version/bin/linux/amd64/kubectl && \
    curl -Lf -o /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v$kind_version/kind-linux-amd64 && \
    curl -Lf -o /usr/local/bin/kubectl-kudo https://github.com/kudobuilder/kudo/releases/download/v${kudo_version}/kubectl-kudo_${kudo_version}_linux_x86_64 && \
    curl -Lf https://get.helm.sh/helm-v$helm_version-linux-amd64.tar.gz |tar -xzf - -C /usr/local/bin/ --strip-components 1 linux-amd64/helm && \
    helm init --client-only && chmod +x /usr/local/bin/kubectl /usr/local/bin/kind /usr/local/bin/kubectl-kudo
