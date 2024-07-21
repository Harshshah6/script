sudo apt install git-lfs
git lfs install

rm -rf vendor/gmsrm -rf .repo/projects/vendor/gms.git
rm -rf .repo/project-objects/*/android_vendor_gms.git

repo init --depth=1  -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs

rm -rf .repo/local_manifests
git clone https://github.com/Harshshah6/local_manifests --depth 1 -b main .repo/local_manifests

/opt/crave/resync.sh

# Fixing fingerprint
sudo rm -rf vendor/fingerprint/opensource/interfaces
git clone https://github.com/xiaomi-msm8953-devs/android_vendor_fingerprint_opensource_interfaces vendor/fingerprint/opensource/interfaces

source build/envsetup.sh

export BUILD_USERNAME=HarshShah
export BUILD_HOSTNAME=crave

export RISING_MAINTAINER="LEGENDARY STREAMER"
export RISING_PACKAGE_TYPE := "VANILLA_AOSP"
export TARGET_ENABLE_BLUR := true

riseup ysl userdebug
rise b
