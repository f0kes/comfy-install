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


NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/aravindhv10/ComfyUI-TiledDiffusion#fix_controlnet"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
)


CHECKPOINT_MODELS=(
    "https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    #"https://huggingface.co/Zhengyi/CRM/resolve/main/ccm-diffusion.pth"
    #"https://huggingface.co/Zhengyi/CRM/resolve/main/pixel-diffusion.pth"
    #"https://huggingface.co/Zhengyi/CRM/resolve/main/CRM.pth"
    #"https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
    #"https://civitai.com/api/download/models/128713"
    #"https://civitai.com/api/download/models/131004"
)

LORA_MODELS=(
    #"https://civitai.com/api/my_download/models/16576"
    #"https://civitai.com/api/download/models/30200"
)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    #"https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    #"https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    #"https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11f1e_sd15_tile_fp16.safetensors"
    "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11f1p_sd15_depth_fp16.safetensors"
    "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_canny_fp16.safetensors"
    "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_openpose_fp16.safetensors"
    "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_seg_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

function main() {
    install_comfyui
    get_nodes
    get_models "${CHECKPOINT_PATH}" "${CHECKPOINT_MODELS[@]}"
    get_models "${LORA_PATH}" "${LORA_MODELS[@]}"
    get_models "${VAE_PATH}" "${VAE_MODELS[@]}"
    get_models "${ESRGAN_PATH}" "${ESRGAN_MODELS[@]}"
    get_models "${CONTROLNET_PATH}" "${CONTROLNET_MODELS[@]}"
    printf "Done!\n"
}

function install_comfyui() {
    cd "${WORKSPACE_PATH}" || exit
    if [[ -d "${COMFYUI_PATH}" ]]; then
        printf "Updating ComfyUI...\n"
        (cd "${COMFYUI_PATH}" && git pull)
    else
        printf "Downloading ComfyUI...\n"
        git clone https://github.com/comfyanonymous/ComfyUI
        cd "${COMFYUI_PATH}" || exit
        pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
        pip install -r requirements.txt
    fi
}

function get_nodes() {
    for repo in "${NODES[@]}"; do
        IFS="#" read -r url branch <<<"${repo}"
        url="${url:-$repo}"
        branch="${branch:-}"
        dir="${url##*/}"
        path="${COMFYUI_PATH}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"

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

main
pip install gdown
gdown ${GOOGLE_DRIVE_FOLDER} -O ${INPUT_PATH} --folder
#cd /workspace/comfy-install/
#wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
#dpkg -i cloudflared-linux-amd64.deb
#python /workspace/comfy-install/cloudflare.py
python /workspace/ComfyUI/main.py --listen