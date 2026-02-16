#!/bin/bash
#SBATCH --job-name=l4s_train
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=8
#SBATCH --output=l4s_%j.out
#SBATCH --error=l4s_%j.err

# ---- environment ----
source ~/.bashrc
conda activate l4s

# ---- move to code ----
cd /home/vaibhavt_iitp/Landslide4Sense-2022

# ---- sanity prints (very helpful) ----
echo "Job running on $(hostname)"
nvidia-smi
python --version

# ---- train ----
python -u Train.py \
  --data_dir /scratch/vaibhavt_iitp/landslide4sense/ \
  --gpu_id 0
