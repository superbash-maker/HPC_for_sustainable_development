#!/bin/bash
module purge
module load gcc/9.2.0
module load chpc/cmake/3.26.3/gcc-9.2.0
module load chpc/python/anaconda/3-2021.11  

export PATH=/apps/chpc/chem/openmpi/4.1.5:$PATH
export LD_LIBRARY_PATH=/apps/chpc/chem/openmpi/4.1.5/lib:$LD_LIBRARY_PATH
export MPI_HOME=/apps/chpc/chem/openmpi/4.1.5
export MPI_RUN=/apps/chpc/chem/openmpi/4.1.5/bin/mpirun

rm -r build
mkdir build
cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCMAKE_INSTALL_PREFIX=/mnt/lustre/users/krishna/gmx_cpu
make 
make install
