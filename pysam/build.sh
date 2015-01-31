#!/bin/bash
# Remove gcc statements that do not work on older compilers for CentOS5 support
sed -i'' -e 's/"-Wno-error=declaration-after-statement",//g' setup.py
sed -i'' -e 's/"-Wno-error=declaration-after-statement"//g' setup.py
$PYTHON setup.py install
