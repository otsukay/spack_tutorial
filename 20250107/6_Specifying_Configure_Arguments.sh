#!/bin/bash

#spack edit tutorial-mpileaks
cp ~/spack_tutorial/20250107/tutorial-mpileaks/3.py $HOME/my_pkgs/spack_repo/tutorial/packages/tutorial_mpileaks/package.py

spack install tutorial-mpileaks
