#!/bin/bash

spack repo create $HOME/my_pkgs tutorial
spack repo add $HOME/my_pkgs/spack_repo/tutorial

spack repo list

spack config get repos
