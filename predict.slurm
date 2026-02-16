#!/bin/bash
#SBATCH --job-name=l4s_predict
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --output=l4s_pred_%j.out
#SBATCH --error=l4s_pred_%j.err

# ---- environment ----
source ~/.bashrc
conda activate l4s

# ---- move to code ----
cd /home/vaibhavt_iitp/Landslide4Sense-2022

# ---- sanity prints ----
echo "Job running on $(hostname)"
nvidia-smi
python --version

# ---- predict ----
python -u Predict.py \
  --data_dir /scratch/vaibhavt_iitp/landslide4sense/ \
  --restore_from ./exp/batch4000_F1_7382.pth \
  --gpu_id 0
