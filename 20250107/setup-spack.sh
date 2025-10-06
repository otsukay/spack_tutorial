#!/bin/bash

git clone --depth=2 --branch=releases/v1.0 https://github.com/spack/spack
. spack/share/spack/setup-env.sh
spack repo update builtin --tag v2025.07.0
spack mirror add tutorial /mirror
spack buildcache keys --install --trust
spack bootstrap now
spack compiler find
