#!/bin/bash
cd /workspace/ComfyUI/custom_nodes
git clone https://github.com/flowtyone/ComfyUI-Flowty-CRM.git
cd ComfyUI-Flowty-CRM
pip install -r requirements.txt
pip install -r requirements-cuda.txt