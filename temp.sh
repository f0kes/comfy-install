#!/bin/bash
COMFYUI_PATH="/workspace/ComfyUI"
WORKSPACE_PATH="/workspace"
NODES_PATH="${COMFYUI_PATH}/custom_nodes"
CHECKPOINT_PATH="${COMFYUI_PATH}/models/checkpoints"
LORA_PATH="${COMFYUI_PATH}/models/lora"
VAE_PATH="${COMFYUI_PATH}/models/vae"
ESRGAN_PATH="${COMFYUI_PATH}/models/upscale_models"
CONTROLNET_PATH="${COMFYUI_PATH}/models/controlnet"
INPUT_PATH="${COMFYUI_PATH}/input"
GOOGLE_DRIVE_FOLDER="https://drive.google.com/drive/folders/1upDm3Ef0GuBjkNLF7zsQTEgrBQRPJ0Ki"

CHECKPOINT_MODELS=(
    "https://huggingface.co/Zhengyi/CRM/resolve/main/ccm-diffusion.pth"
    "https://huggingface.co/Zhengyi/CRM/resolve/main/pixel-diffusion.pth"
    "https://huggingface.co/Zhengyi/CRM/resolve/main/CRM.pth"
)

function get_models() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    if [[ $DISK_GB_ALLOCATED -ge $DISK_GB_REQUIRED ]]; then
        arr=("$@")
    else
        printf "WARNING: Low disk space allocation - Only the first model will be downloaded!\n"
        arr=("$1")
    fi

    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        my_download "${url}" "${dir}"
        printf "\n"
    done
}

# Download from $1 URL to $2 file path
function my_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

get_models "${CHECKPOINT_PATH}" "${CHECKPOINT_MODELS[@]}"
