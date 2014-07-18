`conda <http://conda.pydata.org/docs/>`_ recipes for `bcbio-nextgen
<https://github.com/chapmanb/bcbio-nextgen>`_ and `bcbio-nextgen-vm
<https://github.com/chapmanb/bcbio-nextgen-vm>`_.

To build and upload for a specific platform, first ask
`Brad <http://github.com/chapmanb>`_ for permission to write to the
bcbio organization. You will need to have ``conda`` and ``binstar`` available on
your PATH and ``conda-build`` installed. Then run
the `ansible <http://www.ansible.com/home>`_ playbook::

  ansible-playbook to-binstar.yaml

The output is noisy if some packages already exist at the given version. We
don't currently have a good way to query this via ansible but welcome
suggestions from ansible/conda experts.

To use these packages, add the `bcbio conda channel
<https://conda.binstar.org/bcbio>`_::
  conda config --add channels https://conda.binstar.org/bcbio

Linux packages are built on CentOS 5.x with gcc-4.1 to maintain
compatibility with these systems.
