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

function get_nodes() {
    local nodes=("$@")

    for repo in "${nodes[@]}"; do
        IFS="#" read -r url branch <<<"${repo}"
        url="${url:-$repo}"
        branch="${branch:-}"
        dir="${url##*/}"
        path="${COMFYUI_PATH}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        requirements_cuda="${path}/requirements-cuda.txt"

        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                if [[ -n "$branch" ]]; then
                    (cd "$path" && git fetch && git checkout "$branch" && git pull)
                else
                    (cd "$path" && git pull)
                fi
                if [[ -e $requirements ]]; then
                    pip install -r "$requirements"
                fi
                if [[ -e $requirements_cuda ]]; then
                    pip install -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            if [[ -n "$branch" ]]; then
                git clone -b "${branch}" "${url}" "${path}" --recursive
            else
                git clone "${url}" "${path}" --recursive
            fi
            if [[ -e $requirements ]]; then
                pip install -r "$requirements"
            fi
            if [[ -e $requirements_cuda ]]; then
                pip install -r "$requirements"
            fi
        fi
    done
}
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
