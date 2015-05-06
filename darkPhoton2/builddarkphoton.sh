#!/bin/bash
# Run annihilation

cd darkPhotonBuild

cmake -DGEANT4_BUILD_MULTITHREADED=OFF -DGeant4_DIR=/usr/local/geant4.10.00.p01/lib64/Geant4-10.0.0 -DHEPMC_INCLUDE_DIR=../../madgraph/hepmcbuild/include/ -DHEPMC_LIBRARIES=../../madgraph/hepmcbuild/lib/libHepMC.so ../darkPhoton
#cmake -DGEANT4_BUILD_MULTITHREADED=ON -DGeant4_DIR=/usr/local/geant4.10.00.p01/lib64/Geant4-10.0.0 /home/local1/Dark-Photons/Cari_Code/darkPhoton
make clean
make -j4
./darkPhoton
mkdir /home/local1/clusterData/FinalPlots/FixReso
currentfolder=$(date +%Y:%m:%d#%H:%M:%S)
mkdir /home/local1/clusterData/FinalPlots/FixReso/$currentfolder
mv *.root /home/local1/clusterData/FinalPlots/FixReso/$currentfolder
rm -rf *.root
cd /home/local1/clusterData/FinalPlots/FixReso/$currentfolder
hadd complete.root *.root
mkdir threadfiles
mv *.root threadfiles
cd threadfiles
mv complete.root ../
