FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install build essentials
RUN apt-get update --fix-missing && apt-get install -y --fix-missing build-essential

# Install Julia, currently it's getting installed from devcontainer.json
# curl -fsSL https://install.julialang.org | sh

USER vscode