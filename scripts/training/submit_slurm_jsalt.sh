#!/bin/bash

#SBATCH --job-name=train-tswhisper
#SBATCH --nodes=1
#SBATCH --gpus=4
#SBATCH --nodelist=e04
#SBATCH --partition=jsalt25
#SBATCH --account=jsalt25
#SBATCH --output=/export/fs06/xhe69/TS-ASR-Whisper/exp_out_logs/%x_%j.out          ### Slurm Output file, %x is job name, %j is job id
#SBATCH --error=/export/fs06/xhe69/TS-ASR-Whisper/exp_out_logs/%x_%j.out           ### Slurm Error file, %x is job name, %j is job id\

export N_GPUS=4
export CUDA_VISIBLE_DEVICES="$(seq -s ',' 0 $((N_GPUS-1)))"

# /export/fs06/dklemen1/chime_followup/CHIME2024_new/scripts/training/run_train.sh "$@"
./scripts/training/run_train.sh "$@"
