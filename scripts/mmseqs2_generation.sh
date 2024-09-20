#!/bin/bash

#SBATCH --job-name=MMseqs2_MSA_Protein                      # Job Name
#SBATCH --output=mmseqs2_msa_Protein.out                    # File to which STDOUT will be written
#SBATCH --error=mmseqs2_msa_Protein.log                     # File to which STDERR will be written
#SBATCH --time=06:00:00                                     # Time Limit (hrs:min:sec)
#SBATCH --ntasks=1                                          # Number of Tasks (Processes)
#SBATCH --nodes=1                                           # Number of Nodes
#SBATCH --cpus-per-task=4                                   # Number of CPU Cores Per Task
#SBATCH --mem=32G                                           # Total Memory Limit

# Running Python Script for Generation of MMseqs2 MSA

# --config_file: Path to the JSON configuration file
# --jobname: Name of the Job
# --sequence_path: Path to the Sequence Fasta File
# --output_path: Path to the Output Directory
# --homooligomers: Number of Homooligomers (1 for Monomer, 2 for Dimer, etc.)

SCRIPT_PATH = "path/to/mmseqs2_generation.py"
CONFIG_FILE = "/path/to/config.json"
JOBNAME = "JOBNAME"
SEQUENCE_PATH = "/path/to/sequence.fasta"
OUTPUT_PATH = "/path/to/Protein_MMseqs2_Structure_Predictions"
HOMOOLIGOMERS = 1

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --jobname "$JOBNAME" \
    --sequence_path "$SEQUENCE_PATH" \
    --output_path "$OUTPUT_PATH" \
    --homooligomers "$HOMOOLIGOMERS" \