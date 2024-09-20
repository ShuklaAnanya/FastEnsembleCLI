# Import Libraries
import json
import os

# Configuration Dictionary
config = {
    "_comment": "GENERAL CONFIGURATIONS",                       # comment: Structure Prediction Configuration File
    "output_path": "/path/to/sample_predictions",               # output_path: Path to save the predictions
    "jobname": "job_name",                                      # jobname: Name of the job

    "_comment2": "CONFIGURATIONS TO BUILD MSA",                 # comment: MSA Configuration
    "sequence_path": "protein_sequence.fasta",                  # sequence_path: Path to the Protein Sequence File (FASTA) [.fasta/.fa]
    "tmp_dir": "tmp",                                           # tmp_dir: Path to the Temporary Directory (used to store intermediate files)
    "homooligomers": 1,                                         # homooligomers: Number of Identical Subunits (Monomers) in the Multimeric Protein Complex (Oligomer)
    # "homooligomers": 2 ()
    "use_ramdisk": True,                                        # use_ramdisk: Use RAM Disk to Store Intermediate Files (Improves Speed)

    "_comment3": "CONFIGURATIONS TO MAKE PREDICTIONS",          # comment: Prediction Configuration
    "engine": "alphafold2",                                     # engine: Prediction Engine [alphafold2/roseTTAFold]
    "msa_path": None,                                           # msa_path: Path to the Multiple Sequence Alignment (MSA) File [.a3m/.sto] 
    "msa_from": "mmseqs2",                                      # msa_from: MSA Generation Tool [mmseqs2/jackhmmer]
    "seq_pairs": [                                              # seq_pairs: max_seq:extra_seq (Arbitrary Number of Sequences Randomly Selected from the MSA)
        [64, 128],
        [128, 256],
        [256, 512],
        [512, 1024]
    ],
    "seeds": 10,                                                # seeds: Number of Seeds to Use for Sampling (used to generate diverse predictions)
    "platform": "cpu",                                          # platform: Hardware Platform to Use for Prediction [cpu/gpu]
    "save_all": False,                                          # save_all: Save All Predictions (including intermediate models)
    "models": [1, 2, 3, 4, 5],                                  # models: Models to Use for Prediction [1-5]
    "recycles": 4,                                              # recycles: Number of Recycles to Use for Prediction (Used to Refine the Predictions)
    "subset_msa_to": None,                                      # subset_msa_to: Subset MSA to Use for Prediction (Used to Reduce the Size of MSA Depth)

    "_comment4": "GENERAL ANALYSIS CONFIGURATIONS",
    "align_range": "backbone",                                  # align_range: Range to Use for Alignment [backbone/all]
    "ref1d": None,                                              # ref1d: Reference 1D Structure (Used to Calculate RMSD)
    "ref2d1": None,                                             # ref2d1: Reference 2D Structure 1 (Used to Calculate RMSD)
    "ref2d2": None,                                             # ref2d2: Reference 2D Structure 2

    "_comment5": "RMSF ANALYSIS CONFIGURATIONS",
    "detect_mobile": True,                                      # detect_mobile: Detect Mobile or Flexible Regions in the Protein Structure (using RMSF)
    "peak_width": 3,                                            # peak_width: Minimum Width of the Peak (Consecutive Residues with RMSF > Peak Height)
    "peak_prominence": 1,                                       # peak_prominence: Measure of how a Peak Stands Out from the Rest of the Fluctuations (RMSF)
    "peak_height": 2,                                           # peak_height: Minimum Height of the Peak to be considered as a Region of Flexibility
    "starting_residue": 200,

    "_comment6": "RMSD ANALYSIS CONFIGURATIONS",
    "analysis_range": "backbone and resid 358-365",             # analysis_range: 
    "analysis_range_name": "aloop",                             # analysis_range_name: 

    "_comment7": "RMSD_2D OR TMSCORE_2D CONFIGURATIONS",
    "mode_results": None,                                       # mode_results: Mode of Results [rmsd_2d/tmscore_2d]
    "n_stdevs": 5,                                              # n_stdevs: Number of Standard Deviations to Use for Calculating RMSD_2D or TMSCORE_2D

    "_comment8": "TMSCORE CONFIGURATIONS",
    "slice_predictions": "backbone and resid 210-459",          # slice_predictions: Slice Predictions to Use for TMSCORE Calculation

    "_comment10": "PCA CONFIGURATIONS",
    "n_pca_clusters": 3,                                        # n_pca_clusters: Number of PCA Clusters (Active, Intermediate, Inactive)

    "_comment11": "TRAJECTORY SAVING CONFIGURATIONS",
    "reorder": "rmsd_1d",                                       # reorder: Reorder the Predictions based on RMSD_1D
    "traj_format": "pdb",                                       # traj_format: Trajectory Format [pdb/dcd]

    "n_clusters": None                                          # n_clusters: Number of Clusters to Use for Clustering 
}

def main():
    # Extract output path
    output_path = config.get("output_path")

    # Create directory if it doesn't exist
    if not os.path.exists(output_path):
        os.makedirs(output_path)

    # Save the config dictionary to config.json
    with open("config.json", "w") as config_file:
        json.dump(config, config_file, indent=4)

if __name__ == "__main__":
    main()
