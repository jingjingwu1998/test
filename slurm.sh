#!/bin/bash
#SBATCH --job-name=01_hicpro_digest       # Job name
#SBATCH --output=01_hicpro_digest_%j.log # Standard output and error log (%j for job ID)
#SBATCH --time=12:00:00                  # Walltime limit
#SBATCH --nodes=1                        # Number of nodes
#SBATCH --ntasks=1                       # Number of tasks
#SBATCH --cpus-per-task=4                # Number of CPU cores per task
#SBATCH --mem=32G                        # Memory required per node
#SBATCH --mail-type=BEGIN,END,FAIL       # Email notifications for job events
#SBATCH --mail-user=Jingjing.Wu@moffitt.org  # Email address for notifications
