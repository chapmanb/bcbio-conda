`conda <http://conda.pydata.org/docs/>`_ recipes for `bcbio-nextgen
<https://github.com/chapmanb/bcbio-nextgen>`_ and `bcbio-nextgen-vm
<https://github.com/chapmanb/bcbio-nextgen-vm>`_.

To build and upload for a specific platform, first ask
`Brad <http://github.com/chapmanb>`_ for permission to write to the
bcbio organization. You will need to have ``conda`` and ``anaconda`` available on
your PATH and ``conda-build`` installed::

  conda install conda anaconda-client conda-build

Then run::

  python update_binstar_packages.py

If you need to build libraries with C extensions on Linux, use a CentOS 5.x
container::

  docker run --net=host -i -t -v `pwd`:/tmp/bcbio-conda centos:centos5 /bin/bash /tmp/bcbio-conda/update_binstar_packages_docker.sh

The scripts will query available packages and try to build and upload any that
are not present. Depending on your system you may not be able to build some
packages.  For instance, you can't create Mac OSX packages on Linux when they
contain C extensions.

To use these packages, add the `bcbio conda channel
<https://anaconda.org/bcbio>`_::

  conda config --add channels bcbio

To maintain compatibility, we build packages with:

- numpy 1.9
- CentOS 5.x (using docker with centos:centos5)
