#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.6.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/LSYDY-Router/g' package/base-files/files/bin/config_generate

# Modify filename, add date prefix
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=AP-$(shell date +"%Y%m%d")-/1' include/image.mk

#rm -rf feeds/packages/utils/watchcat
#git clone --depth=1 https://github.com/openwrt/packages/tree/master/utils/watchcat feeds/packages/utils/watchcat

#设置登录密码为空
#sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings

#调整smartdns和adguardhome插件
rm -rf feeds/luci/applications/luci-app-adguardhome
git clone https://github.com/lsydy260806/luci-app-adguardhome feeds/luci/applications/luci-app-adguardhome

rm -rf feeds/packages/net/adguardhome
git clone https://github.com/lsydy260806/adguardhome feeds/packages/net/adguardhome

rm -rf feeds/luci/applications/luci-app-smartdns
git clone https://github.com/lsydy260806/luci-app-smartdns feeds/luci/applications/luci-app-smartdns

rm -rf feeds/packages/net/smartdns
git clone https://github.com/lsydy260806/smartdns feeds/packages/net/smartdns
