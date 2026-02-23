#!/bin/bash
# Change to the script's directory to ensure we're in the correct working directory
cd "$(dirname "$0")"

# ComfyUI startup script with low VRAM settings for Intel XPU
# This script helps prevent out-of-memory errors on systems with limited VRAM

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

# Start ComfyUI with low VRAM mode and reserved VRAM
# --lowvram: Split models to use less VRAM
# --reserve-vram 2: Reserve 2GB VRAM for OS/other applications
# --listen: Allow access from local network (listens on all interfaces)
python main.py --listen --preview-method taesd --disable-smart-memory --reserve-vram 1 --lowvram

