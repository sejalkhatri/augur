#!/usr/bin/env bash

echo
echo "***********************"
echo "Step 0: Source Anaconda"
echo "***********************"
CONDA_ROOT=$(conda info --root)
source $CONDA_ROOT/etc/profile.d/conda.sh

echo
echo "***********************************"
echo "Step 1: Enable Anaconda environment"
echo "***********************************"
if ! conda activate augur; 
    then conda env create -n=augur -f=environment.yml; 
else conda env update -n=augur -f=environment.yml; 
fi;
bash $CONDA_ROOT/etc/profile.d/conda.sh; conda activate augur;

echo
echo "**********************************"
echo "Step 2: Install pipreqs and Sphinx"
echo "**********************************"
pip install pipreqs sphinx; 

echo
echo "******************************************"
echo "Step 3: Install apidoc, brunch, and newman"
echo "******************************************"
sudo npm install -g apidoc brunch newman; 

echo
echo "***********************************"
echo "Step 4: Install Python dependencies"
echo "***********************************"
pip install -U -e .;

echo
echo "******************************"
echo "Step 5: Install iPython kernel"
echo "******************************"
sudo python -m ipykernel install --user --name augur --display-name "Python (augur)"; 

echo
echo "*********************************+***********"
echo "Step 6: Install frontend Node.js dependencies"
echo "*********************************+***********"
cd frontend/ && npm install;



