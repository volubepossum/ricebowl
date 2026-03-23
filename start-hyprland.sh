#!/bin/bash

# Hyprland launch script
# This script sets up the environment and starts Hyprland

# Set environment variables for Wayland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_CURRENT_DESKTOP=Hyprland

# Set Qt and GTK to use Wayland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland

# NVIDIA specific (uncomment if you have NVIDIA GPU)
# export LIBVA_DRIVER_NAME=nvidia
# export GBM_BACKEND=nvidia-drm
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export WLR_NO_HARDWARE_CURSORS=1

# Start Hyprland
exec Hyprland
