#!/bin/bash

#SBATCH --job-name=PCA_Clustering_JAK1_mmseq2
#SBATCH --output=PCA_Clustering_JAK1_mmseq2.out
#SBATCH --error=PCA_Clustering_JAK1_mmseq2.err
#SBATCH --time=48:00:00  # Time limit hrs:min:sec
#SBATCH -p gpu --gres=gpu:1 # Requesting 1 GPU
#SBATCH --ntasks=1  # Number of tasks (processes)
#SBATCH --cpus-per-task=8  # Number of CPU cores per task
#SBATCH --mem=128G  # Total memory limit

SCRIPT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/pca_clustering.py"
CONFIG_FILE="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_mmseq2_config.json"
OUTPUT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_P23458_mmseqs2_PCA_Clustering"
PREDICTIONS_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_P23458_mmseqs2_Ensemble_Structure_Predictions/ensemble_prediction_JAK1_mmseq2/predictions/alphafold2"
JOBNAME="PCA_Clustering_JAK1_mmseq2"
ENGINE="alphafold2"

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --jobname "$JOBNAME" \
    --engine "$ENGINE" \


----------------------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash

#SBATCH --job-name=PCA_Clustering_JAK1_jackhmmer
#SBATCH --output=PCA_Clustering_JAK1_jackhmmer.out
#SBATCH --error=PCA_Clustering_JAK1_jackhmmer.err
#SBATCH --time=48:00:00  # Time limit hrs:min:sec
#SBATCH -p gpu --gres=gpu:1 # Requesting 1 GPU
#SBATCH --ntasks=1  # Number of tasks (processes)
#SBATCH --cpus-per-task=8  # Number of CPU cores per task
#SBATCH --mem=128G  # Total memory limit

SCRIPT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/pca_clustering.py"
CONFIG_FILE="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_jackhmmer_config.json"
OUTPUT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_P23458_JackHMMER_PCA_Clustering"
PREDICTIONS_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_P23458_JackHMMER_Ensemble_Structure_Predictions/ensemble_prediction_JAK1_JackHMMER/predictions/alphafold2"
JOBNAME="PCA_Clustering_JAK1_jackhmmer"
ENGINE="alphafold2"

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --jobname "$JOBNAME" \
    --engine "$ENGINE" \


----------------------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash

#SBATCH --job-name=PCA_Clustering_JAK1_FERM_mmseq2
#SBATCH --output=PCA_Clustering_JAK1_FERM_mmseq2.out
#SBATCH --error=PCA_Clustering_JAK1_FERM_mmseq2.err
#SBATCH --time=48:00:00  # Time limit hrs:min:sec
#SBATCH -p gpu --gres=gpu:1 # Requesting 1 GPU
#SBATCH --ntasks=1  # Number of tasks (processes)
#SBATCH --cpus-per-task=8  # Number of CPU cores per task
#SBATCH --mem=128G  # Total memory limit

SCRIPT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/pca_clustering.py"
CONFIG_FILE="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_FERM_mmseq2_config.json"
OUTPUT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_FERM_P23458_mmseqs2_PCA_Clustering"
PREDICTIONS_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_FERM_P23458_mmseqs2_Ensemble_Structure_Predictions/ensemble_prediction_JAK1_FERM_mmseq2/predictions/alphafold2"
JOBNAME="PCA_Clustering_JAK1_FERM_mmseq2"
ENGINE="alphafold2"

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --jobname "$JOBNAME" \
    --engine "$ENGINE" \


----------------------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash

#SBATCH --job-name=PCA_Clustering_JAK1_FERM_jackhmmer
#SBATCH --output=PCA_Clustering_JAK1_FERM_jackhmmer.out
#SBATCH --error=PCA_Clustering_JAK1_FERM_jackhmmer.err
#SBATCH --time=48:00:00  # Time limit hrs:min:sec
#SBATCH -p gpu --gres=gpu:1 # Requesting 1 GPU
#SBATCH --ntasks=1  # Number of tasks (processes)
#SBATCH --cpus-per-task=8  # Number of CPU cores per task
#SBATCH --mem=128G  # Total memory limit

SCRIPT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/pca_clustering.py"
CONFIG_FILE="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_FERM_jackhmmer_config.json"
OUTPUT_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_FERM_P23458_JackHMMER_PCA_Clustering"
PREDICTIONS_PATH="/users/ashukl30/data/Shukla_AlphaFold2/decaf_e_dev/JAK1_FERM_P23458_JackHMMER_Ensemble_Structure_Predictions/ensemble_prediction_JAK1_FERM_JackHMMER/predictions/alphafold2"
JOBNAME="PCA_Clustering_JAK1_FERM_jackhmmer"
ENGINE="alphafold2"

python $SCRIPT_PATH \
    --config_file "$CONFIG_FILE" \
    --output_path "$OUTPUT_PATH" \
    --predictions_path "$PREDICTIONS_PATH" \
    --jobname "$JOBNAME" \
    --engine "$ENGINE" \


----------------------------------------------------------------------------------------------------------------------------------------------------------------
