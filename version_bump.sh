#!/bin/bash

# pubspec.yaml dosyasındaki mevcut versiyonu al
current_version=$(grep 'version:' pubspec.yaml | sed 's/version: //')

# Mevcut versiyonun sonunu al (patch kısmı)
version_major=$(echo $current_version | cut -d. -f1)
version_minor=$(echo $current_version | cut -d. -f2)
version_patch=$(echo $current_version | cut -d. -f3 | cut -d+ -f1)
version_build=$(echo $current_version | cut -d+ -f2)

# Patch versiyonunu artır
new_version_patch=$((version_patch + 1))

# Yeni versiyonu ayarla
new_version="$version_major.$version_minor.$new_version_patch+$version_build"

# pubspec.yaml dosyasındaki versiyonu güncelle (Linux'ta sed için -i '' gerekli değil)
sed -i "s/version: .*/version: $new_version/" pubspec.yaml

# Yeni versiyonu ekrana yazdır
echo "Yeni versiyon: $new_version"
