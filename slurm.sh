#!/bin/bash
#SBATCH --job-name=download_pyega3       # Job name
#SBATCH --output=%x_%j.log  # %x uses the job name dynamically
#SBATCH --time=12:00:00                  # Walltime limit
#SBATCH --nodes=1                        # Number of nodes
#SBATCH --ntasks=1                       # Number of tasks
#SBATCH --cpus-per-task=4                # Number of CPU cores per task
#SBATCH --mem=32G                        # Memory required per node
#SBATCH --mail-type=BEGIN,END,FAIL       # Email notifications for job events
#SBATCH --mail-user=Jingjing.Wu@moffitt.org  # Email address for notifications


# Activate the conda environment
conda activate py3.7
# pyega3 -c 1 -cf /home/80030577/ega-download-client/pyega3/config/default_credential_file.json fetch EGAF00004726920 --output-dir /share/lab_teng/trainee/JingjingWu/EBV/spaindata
# pyega3 -c 5 -cf /home/80030577/ega-download-client/pyega3/config/default_credential_file.json fetch EGAF00004726921 --output-dir /share/lab_teng/trainee/JingjingWu/EBV/spaindata

for id in $(seq 26922 26975); do pyega3 -c 5 -cf /home/80030577/ega-download-client/pyega3/config/default_credential_file.json fetch EGAF000047$id --output-dir /share/lab_teng/trainee/JingjingWu/EBV/spaindata; done
