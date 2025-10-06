#!/bin/bash

spack create --skip-editor --name tutorial-mpileaks https://github.com/LLNL/mpileaks/archive/refs/tags/v1.0.tar.gz

spack checksum tutorial-mpileaks 1.0

spack install tutorial-mpileaks

