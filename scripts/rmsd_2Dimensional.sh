#!/bin/bash

#SBATCH --job-name=RMSD_MODE_2D_JAK1
#SBATCH --output=RMSD_MODE_2D_JAK1.out
#SBATCH --error=RMSD_MODE_2D_JAK1.err
#SBATCH --time=48:00:00
#SBATCH -p gpu --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G

SCRIPT_PATH = "path/to/rmsd_mode2d.py"
CONFIG_FILE = "/path/to/config.json"
OUTPUT_PATH = "path/to/Protein_mmseq2_RMSD_MODE_2D"
PREDICTIONS_PATH = "path/to/Protein_mmseq2_Ensemble_Structure_Predictions"      # Path to the Ensemble Predictions
JOBNAME = "Protein_mmseq2_RMSD_MODE_1D"                                         # Name of the Job
ENGINE = "alphafold2"                                                           # Engine for Structure Prediction (alphafold2 or rosetta)
REF1D = "reference.pdb"                                                         # Reference 1D Structure (PDB File)
REF2D = "reference.pdb"                                                         # Reference 2D Structure (PDB File)
N_STDEVS = 2                                                                    # Number of Standard Deviations for RMSD Calculation (Used for Outlier Detection)

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --jobname "$JOBNAME" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --engine "$ENGINE" \
    --ref1d "$REF1D" \
    --ref2d "$REF2D" \
    --n_stdevs "$N_STDEVS"