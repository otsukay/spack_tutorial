#!/bin/bash

#cat /tmp/spack/spack-stage/spack-stage-tutorial-mpileaks-1.0-bsn3xirjorc7l2stboooavdkrd4aa3q4/spack-build-out.txt
cat $(spack location tutorial-mpileaks)/../spack-build-out.txt

spack cd tutorial-mpileaks

spack build-env tutorial-mpileaks bash

# The hash value in the following line may vary; check the appropriate line in 'spack-build-out.txt'.
./configure --prefix=/home/spack/spack/opt/spack/linux-x86_64_v3/tutorial-mpileaks-1.0-bsn3xirjorc7l2stboooavdkrd4aa3q4

./configure --help

exit
cd $SPACK_ROOT
