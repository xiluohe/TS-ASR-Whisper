#!/bin/bash

#SBATCH --job-name=train-tswhisper
#SBATCH --nodes=1
#SBATCH --gpus=2
#SBATCH --partition=gpu-a100 
#SBATCH --account=a100acct
#SBATCH --output=/export/fs06/xhe69/TS-ASR-Whisper/exp_out_logs/%x_%j.out          ### Slurm Output file, %x is job name, %j is job id
#SBATCH --error=/export/fs06/xhe69/TS-ASR-Whisper/exp_out_logs/%x_%j.out           ### Slurm Error file, %x is job name, %j is job id\

export N_GPUS=2
export CUDA_VISIBLE_DEVICES="$(seq -s ',' 0 $((N_GPUS-1)))"

# /export/fs06/dklemen1/chime_followup/CHIME2024_new/scripts/training/run_train.sh "$@"
./scripts/training/run_train.sh "$@"
