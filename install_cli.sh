#!/bin/bash -e
# Comment: -e flag makes the script exit immediately if a command exits with a non-zero status 

# Installing FastEnsemble
# type wget 2>/dev/null || { echo "wget is not installed. Please install it using apt or yum." ; exit 1 ; }
type wget 2>/dev/null || { echo "wget is not installed! \nPlease install it using 'sudo apt-get install wget' (for Debian-based systems) or 'sudo yum install wget' (for Red Hat-based systems)" ; exit 1 ; }

CURRENTPATH=`pwd`
PACKAGEDIR="${CURRENTPATH}/fast_ensemble"

mkdir -p "${PACKAGEDIR}"
cd "${PACKAGEDIR}"

# Installing Miniforge
wget -q -P . https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
bash ./Mambaforge-Linux-x86_64.sh -b -p "${PACKAGEDIR}/conda"
rm Mambaforge-Linux-x86_64.sh

# Installing FastEnsemble Conda Environment
source "${PACKAGEDIR}/conda/etc/profile.d/conda.sh"
export PATH="${PACKAGEDIR}/conda/condabin:${PATH}"
conda update -n base conda -y
conda create -p "$PACKAGEDIR/fast_ensemble-conda" -c conda-forge -c bioconda -c biocore \
    git python=3.10 openmm==7.7.0 pdbfixer \
    kalign2=2.04 hhsuite=3.3.0 mmseqs2=15.6f452 hmmer scikit-learn mdanalysis seaborn scipy -y
conda activate "$PACKAGEDIR/fast_ensemble-conda"

# Installing ColabFold and Jaxlib
"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install --no-warn-conflicts \
    "colabfold[alphafold-minus-jax] @ git+https://github.com/GMdSilva/ColabFold"
"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install "colabfold[alphafold]"
"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install --upgrade "jax[cuda12]"==0.4.28
"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install --upgrade tensorflow
"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install silence_tensorflow
"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install pdb-tools

"$PACKAGEDIR/fast_ensemble-conda/bin/pip" install --no-warn-conflicts \
    "fast_ensemble @ git+https://github.com/GMdSilva/FastEnsemble"

# Anti-Grain Geomentry (AGG) for non-GUI Rendering Backend
cd "${PACKAGEDIR}/fast_ensemble-conda/lib/python3.10/site-packages/colabfold"
sed -i -e "s#from matplotlib import pyplot as plt#import matplotlib\nmatplotlib.use('Agg')\nimport matplotlib.pyplot as plt#g" plot.py

# Modify the default params Directory
sed -i -e "s#appdirs.user_cache_dir(__package__ or \"colabfold\")#\"{$PACKAGEDIR}/colabfold\"#g" download.py
# Suppress warnings related to Tensorflow
sed -i -e "s#from io import StringIO#from io import StringIO\nfrom silence_tensorflow import silence_tensorflow\nsilence_tensorflow()#g" batch.py
# Remove cache Directory
rm -rf __pycache__

# Install TM-Align
sudo apt install tm-align

# Download ColabFold-AlphaFold2 Weights
# "$PACKAGEDIR/fast_ensemble-conda/bin/python3" -m colabfold.download
"$PACKAGEDIR/fast_ensemble-conda/bin/python3" "$PACKAGEDIR/fast_ensemble-conda/lib/python3.10/site-packages/colabfold/download.py"

echo "Download of Alphafold2 weights finished!"
echo "-----------------------------------------"
echo "Installation of fast_ensemble CLI finished!"
echo "Add ${PACKAGEDIR}/fast_ensemble-conda/bin to your PATH environment variable to run 'fast_ensemble'."
echo -e "i.e. for Bash:\n\texport PATH=\"${PACKAGEDIR}/fast_ensemble-conda/bin:\$PATH\""
echo "For more details, please run 'fast_ensemble --help'."