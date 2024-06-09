#!/bin/bash

NODES=(
    "https://github.com/flowtyone/ComfyUI-Flowty-TripoSR"
)

CHECKPOINT_MODELS=(
    "https://huggingface.co/stabilityai/TripoSR/resolve/main/model.ckpt"
)

source /workspace/comfy-install/common.sh

get_nodes "${NODES[@]}"
get_models "${CHECKPOINT_PATH}" "${CHECKPOINT_MODELS[@]}"
