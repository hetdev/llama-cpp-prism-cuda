# llama.cpp PrismML fork — server image (CUDA 12.4)

Docker image of the [PrismML llama.cpp fork](https://github.com/PrismML-Eng/llama.cpp)
prebuilt binaries (release `prism-b10685-7dffb15`), packaged with the same contract
as `ghcr.io/ggmlorg/llama.cpp:server-cuda`:

- `ENTRYPOINT llama-server`, listens on port 8080, args appended by the platform.
- Adds support for the private ternary quant types (TQ1_0 / PTQ1_0, ggml type 143/142)
  used by PrismML Bonsai packs, e.g. `dealignai/Bonsai-2-27B-1bit-CRACK-GGUF`.

Built for `linux/amd64` by GitHub Actions and published to
`ghcr.io/hetdev/llama-cpp-prism-cuda`.

## Update to a newer PrismML release

Edit `PRISM_TAG` / `PRISM_TARBALL` in the `Dockerfile` and push — the workflow
rebuilds and republishes `:latest`.
