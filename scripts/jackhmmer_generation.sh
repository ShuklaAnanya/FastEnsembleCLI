#!/bin/bash

#SBATCH --job-name=JackHMMER_MSA_Protein
#SBATCH --output=jackhmmer_msa_Protein.out
#SBATCH --error=jackhmmer_msa_Protein.log
#SBATCH --time=06:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G

# Running Python Script for Generation of JackHMMER MSA

# --config_file: Path to the JSON configuration file
# --jobname: Name of the Job
# --sequence_path: Path to the Sequence Fasta File
# --output_path: Path to the Output Directory
# --homooligomers: Number of Homooligomers (1 for Monomer, 2 for Dimer, etc.)

SCRIPT_PATH = "path/to/jackhmmer_generation.py"
CONFIG_FILE = "/path/to/config.json"
JOBNAME = "JOBNAME"
SEQUENCE_PATH = "/path/to/sequence.fasta"
OUTPUT_PATH = "/path/to/Protein_JackHMMER_Structure_Predictions"
HOMOOLIGOMERS = 1
 
python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --jobname "$JOBNAME" \
    --sequence_path "$SEQUENCE_PATH" \
    --output_path "$OUTPUT_PATH" \
    --homooligomers "$HOMOOLIGOMERS" \