#!/bin/bash

#SBATCH --job-name=ensemble_prediction_Protein_mmseq2               # Job Name
#SBATCH --output=ensemble_prediction_Protein_mmseq2.out             # File to which STDOUT will be written
#SBATCH --error=ensemble_prediction_Protein_mmseq2.err              # File to which STDERR will be written
#SBATCH --time=48:00:00                                             # Time Limit (hrs:min:sec)
#SBATCH -p gpu --gres=gpu:1                                         # Requesting 1 GPU
#SBATCH --ntasks=1                                                  # Number of Tasks (Processes)
#SBATCH --cpus-per-task=8                                           # Number of CPU Cores Per Task
#SBATCH --mem=128G                                                  # Total Memory Limit

SCRIPT_PATH = "path/to/predict_ensemble.py"
CONFIG_FILE = "/path/to/config.json"
MSA_PATH = "path/to/msa.a3m"                                                    # Path to the MSA File ()
OUTPUT_PATH = "path/to/Protein_mmseqs2_Ensemble_Structure_Predictions"          # Path to the Output Directory
PLATFORM="gpu"                                                                  # Platform (cpu or gpu) for running AlphaFold2
SEEDS=10                                                                        # Number of Seeds for Ensemble Prediction

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --msa_path "$MSA_PATH" \
    --output_path "$OUTPUT_PATH" \
    --save_all \
    --platform "$PLATFORM"
