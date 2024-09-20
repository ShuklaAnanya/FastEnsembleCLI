#!/bin/bash

#SBATCH --job-name=RMSD_PLDDT_Protein
#SBATCH --output=RMSD_PLDDT_Protein.out
#SBATCH --error=RMSD_PLDDT_Protein.err
#SBATCH --time=48:00:00
#SBATCH -p gpu --gres=gpu:1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G

SCRIPT_PATH = "path/to/rmsd_plddt.py"
CONFIG_FILE = "/path/to/config.json"
OUTPUT_PATH = "path/to/Protein_mmseqs2_RMSD_PLDDT"                              # Path to the Output Directory
PREDICTIONS_PATH = "path/to/Protein_mmseqs2_Ensemble_Structure_Predictions"     # Path to the Ensemble Predictions
JOBNAME = "Protein_mmseq2_RMSD_PLDDT"                                           # Name of the Job
ENGINE = "alphafold2"                                                           # Engine for Structure Prediction (alphafold2 or rosetta)

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --jobname "$JOBNAME" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --engine "$ENGINE" \
    --detect_mobile True 
