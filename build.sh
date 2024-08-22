sudo apt install git-lfs
git lfs install
repo init -u https://github.com/DerpFest-AOSP/manifest -b 14 --git-lfs

rm -rf .repo/local_manifests
git clone https://github.com/Harshshah6/local_manifests.git --depth 1 -b derp .repo/local_manifests

/opt/crave/resync.sh

# Fixing fingerprint
sudo rm -rf vendor/fingerprint/opensource/interfaces
git clone https://github.com/xiaomi-msm8953-devs/android_vendor_fingerprint_opensource_interfaces vendor/fingerprint/opensource/interfaces

# Set up build environment
export BUILD_USERNAME=HarshShah
export BUILD_HOSTNAME=crave

source build/envsetup.sh

rm -rf out
make clean

lunch derp_ysl-userdebug
mka derp
