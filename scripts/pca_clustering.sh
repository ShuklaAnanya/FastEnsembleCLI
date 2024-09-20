#!/bin/bash

#SBATCH --job-name=PCA_Clustering_Protein_mmseq2            # Job Name
#SBATCH --output=PCA_Clustering_Protein_mmseq2.out          # File to which STDOUT will be written
#SBATCH --error=PCA_Clustering_Protein_mmseq2.err           # File to which STDERR will be written
#SBATCH --time=48:00:00                                     # Time Limit (hrs:min:sec)
#SBATCH -p gpu --gres=gpu:1                                 # Requesting 1 GPU
#SBATCH --ntasks=1                                          # Number of Tasks (Processes)
#SBATCH --cpus-per-task=8                                   # Number of CPU Cores Per Task
#SBATCH --mem=32G                                           # Total Memory Limit

SCRIPT_PATH = "path/to/pca_clustering.py"
CONFIG_FILE = "path/to/config.json"
OUTPUT_PATH = "path/to/Protein_PCA_Clustering"                                  # Path to the Output Directory
PREDICTIONS_PATH = "path/to/Protein_mmseqs2_Ensemble_Structure_Predictions"     # Path to the Ensemble Predictions
JOBNAME = "PCA_Clustering_Protein_mmseq2"                                       # Name of the Job
ENGINE = "alphafold2"                                                           # Engine for Structure Prediction (alphafold2 or rosetta)

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --jobname "$JOBNAME" \
    --engine "$ENGINE" \