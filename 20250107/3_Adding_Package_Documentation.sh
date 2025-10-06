#!/bin/bash

#spack edit tutorial-mpileaks
cp ~/spack_tutorial/20250107/tutorial-mpileaks/1.py $HOME/my_pkgs/spack_repo/tutorial/packages/tutorial_mpileaks/package.py

git diff ~/spack_tutorial/20250107/tutorial-mpileaks/0.py ~/spack_tutorial/20250107/tutorial-mpileaks/1.py

spack info --phases tutorial-mpileaks


