#!/bin/bash
#SBATCH --job-name=download_pyega3       # Job name
#SBATCH --output=01_hicpro_digest_%j.log # Standard output and error log (%j for job ID)
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

# Define variables
OUTPUT_DIR="/share/lab_teng/trainee/JingjingWu/EBV/spaindata/"
CREDENTIALS_FILE="/path/to/credentials.json"

# Loop through the file IDs from 921 to 975
for FILE_ID in $(seq -f "EGAF00004726%02g" 921 975); do
    echo "Starting download for ${FILE_ID}..."

    # Run pyega3 command
    pyega3 -c 1 -cf ${CREDENTIALS_FILE} fetch ${FILE_ID} --output-dir ${OUTPUT_DIR}

    # Check if the file was successfully downloaded
    if [ $? -eq 0 ]; then
        echo "Download of ${FILE_ID} completed successfully and saved to ${OUTPUT_DIR}."
    else
        echo "Download of ${FILE_ID} failed. Please check the logs for more details."
    fi

    echo "--------------------------------------------"
done
