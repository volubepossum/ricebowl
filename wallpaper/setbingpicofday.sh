#!/bin/bash

# Get the URL of the Bing wallpaper
url=$(curl -s "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=de-DE" | jq -r '.images[0].url')
full_url="https://bing.com${url}"
filename="${full_url##*(\?|&)id=}"
filename="${filename%%&*}"
extension="${filename##*.}"
save_path="$HOME/.config/hypr/wallpaper/picture_of_the_day.${extension}"

# Create directory if it doesn't exist
mkdir -p "$HOME/.config/hypr/wallpaper"

# Download the image
wget -O "$save_path" "$full_url"

hyprctl hyprpaper preload $save_path
hyprctl hyprpaper wallpaper "eDP-1,$save_path"
