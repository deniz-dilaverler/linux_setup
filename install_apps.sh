#!/bin/bash

# Check if the app.txt file exists
if [[ ! -f apps.txt ]]; then
    echo "apps.txt file not found!"
    exit 1
fi

# Add discord RPM package
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Add vscode RPM package
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Setup Steam install
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager --enable fedora-cisco-openh264 -y
# Read app.txt and install each application
while IFS= read -r app; do
    if [[ ! -z "$app" ]]; then
        echo "Installing $app..."
        sudo dnf install -y "$app"
    fi
done < apps.txt

echo "All applications have been installed."
