#!/bin/bash
#SBATCH --job-name=Bowtie2_alignment_test       # Job name
#SBATCH --output=%x_%j.log  # %x uses the job name dynamically
#SBATCH --time=12:00:00                  # Walltime limit
#SBATCH --nodes=1                        # Number of nodes
#SBATCH --ntasks=1                       # Number of tasks
#SBATCH --cpus-per-task=4                # Number of CPU cores per task
#SBATCH --mem=32G                        # Memory required per node
#SBATCH --mail-type=BEGIN,END,FAIL       # Email notifications for job events
#SBATCH --mail-user=Jingjing.Wu@moffitt.org  # Email address for notifications

#bowtie2-build /share/lab_teng/trainee/JingjingWu/EBV/HiC_performance/GRCh37.primary_assembly.genome.fa /share/lab_teng/trainee/JingjingWu/EBV/HiC_performance/bowtie2-build_index/GRCh37

bowtie2 -x /share/lab_teng/trainee/JingjingWu/EBV/HiC_performance/bowtie2-build_index/GRCh37 \
-U /share/lab_teng/trainee/JingjingWu/EBV/hicpro_mapping_2/hicpro_mapping_2/rawdata/Day0/Day0_CKDL220009103-1a_HN2CMDSX3_L3_1.fq.gz \
-S test_GRCh37.sam


# Activate the conda environment
conda activate py3.7
# pyega3 -c 1 -cf /home/80030577/ega-download-client/pyega3/config/default_credential_file.json fetch EGAF00004726920 --output-dir /share/lab_teng/trainee/JingjingWu/EBV/spaindata
# pyega3 -c 5 -cf /home/80030577/ega-download-client/pyega3/config/default_credential_file.json fetch EGAF00004726921 --output-dir /share/lab_teng/trainee/JingjingWu/EBV/spaindata

for id in $(seq 26935 26975); do pyega3 -c 5 -cf /home/80030577/ega-download-client/pyega3/config/default_credential_file.json fetch EGAF000047$id --output-dir /share/lab_teng/trainee/JingjingWu/EBV/spaindata; done
