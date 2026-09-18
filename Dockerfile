# llama.cpp (PrismML fork) server with ternary TQ1_0/PTQ1_0 support.
# Matches the contract of ghcr.io/ggmlorg/llama.cpp:server-cuda:
# ENTRYPOINT llama-server, listening on port 8080, args appended by the platform.
FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

ARG PRISM_TAG=prism-b10685-7dffb15
ARG PRISM_TARBALL=llama-prism-b10685-7dffb15-bin-linux-cuda-12.4-x64.tar.gz

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl libcurl4 libgomp1 \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSfL -o /tmp/prism.tar.gz \
       "https://github.com/PrismML-Eng/llama.cpp/releases/download/${PRISM_TAG}/${PRISM_TARBALL}" \
    && tar -xzf /tmp/prism.tar.gz -C /opt \
    && mv "/opt/llama-${PRISM_TAG}" /opt/prism \
    && rm /tmp/prism.tar.gz \
    && ln -s /opt/prism/llama-server /usr/local/bin/llama-server

ENV LD_LIBRARY_PATH=/opt/prism \
    HF_HOME=/tmp/hf

EXPOSE 8080
ENTRYPOINT ["llama-server"]
