#!/bin/bash
OUTDIR=$PREFIX/share/phylowgs
mkdir -p $OUTDIR
g++ -o mh.o  mh.cpp  util.cpp `gsl-config --cflags --libs`
sed -i '1s/^/#!\/usr\/bin\/env python\n/' evolve.py
cp * $OUTDIR
chmod a+x $OUTDIR/evolve.py
ln -s $OUTDIR/evolve.py $PREFIX/bin/evolve.py
