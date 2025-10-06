#!/bin/bash

cat /tmp/spack/spack-stage/spack-stage-tutorial-mpileaks-1.0-*/spack-build-out.txt

spack cd tutorial-mpileaks

spack build-env tutorial-mpileaks bash

