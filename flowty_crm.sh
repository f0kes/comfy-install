#!/bin/bash
cd /workspace/ComfyUI/custom_nodes
git clone https://github.com/flowtyone/ComfyUI-Flowty-CRM.git
cd ComfyUI-Flowty-CRM
pip install -r requirements.txt
pip install -r requirements-cuda.txt

NODES=(
    "https://github.com/flowtyone/ComfyUI-Flowty-CRM"
)

CHECKPOINT_MODELS=(
    "https://huggingface.co/Zhengyi/CRM/resolve/main/ccm-diffusion.pth"
    "https://huggingface.co/Zhengyi/CRM/resolve/main/pixel-diffusion.pth"
    "https://huggingface.co/Zhengyi/CRM/resolve/main/CRM.pth"
)
source /workspace/comfy-install/common.sh

get_nodes "${NODES[@]}"
get_models "${CHECKPOINT_PATH}" "${CHECKPOINT_MODELS[@]}"
