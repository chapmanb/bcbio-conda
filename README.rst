`conda <http://conda.pydata.org/docs/>`_ recipes for `bcbio-nextgen
<https://github.com/chapmanb/bcbio-nextgen>`_ and `bcbio-nextgen-vm
<https://github.com/chapmanb/bcbio-nextgen-vm>`_.

To build and upload for a specific platform, first ask
`Brad <http://github.com/chapmanb>`_ for permission to write to the
bcbio organization. You will need to have ``conda`` and ``binstar`` available on
your PATH and ``conda-build`` installed. Then run::

  python update_binstar_packages.py

It will query available packages and try to build and upload any that are not
present. Depending on your system you may not be able to build some packages.
For instance, you can't create Mac OSX packages on Linux when they contain C
extensions.

To use these packages, add the `bcbio conda channel
<https://conda.binstar.org/bcbio>`_::

  conda config --add channels https://conda.binstar.org/bcbio
