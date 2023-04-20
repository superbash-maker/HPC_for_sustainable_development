#!/bin/bash
module purge
module load gcc/9.2.0
module load chpc/cmake/3.26.3/gcc-9.2.0
module load chpc/python/anaconda/3-2021.11  
module load chpc/gpu/cuda/12.0/12.0

rm -r build
mkdir build
cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DGMX_GPU=CUDA -DCMAKE_INSTALL_PREFIX=/mnt/lustre/users/krishna/gmx_gpu
make 
make install
