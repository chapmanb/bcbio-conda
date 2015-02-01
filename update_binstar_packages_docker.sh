#!/bin/bash
# Small script to automate building latest packages inside of a bare
# centos:centos5 container. Useful for building dependencies with C
# extensions.
set -e

rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
yum install -y wget bzip2 git gcc gcc-c++ patch zlib-devel
mkdir -p /tmp/bcbio-conda-build
cd /tmp/bcbio-conda-build
wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
bash Miniconda-latest-Linux-x86_64.sh -b -p /tmp/bcbio-conda-build/anaconda
export PATH=/tmp/bcbio-conda-build/anaconda/bin:$PATH
conda install -y conda conda-build binstar pyyaml toolz jinja2

cd /tmp/bcbio-conda
python update_binstar_packages.py
