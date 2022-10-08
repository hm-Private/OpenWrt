#/bin/bash

TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31;1m";;
	g) export Color="\e[32;1m";;
	b) export Color="\e[34;1m";;
	y) export Color="\e[33;0m";;
	z) export Color="\e[35;1m";;
	l) export Color="\e[36;1m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}

while :; do
echo
TIME g "------- 路由 在线升级降级更新 菜单 --------"
echo
TIME r "温馨提示:保存配置可以随意升降各版本!"
echo
TIME g "[1] 更新至 2022.05.23 编译的 R22.5.5  5.15.41"
echo
TIME g "[2] 更新至 2022.06.19 编译的 R22.6.16 5.15.48"
echo
TIME g "[3] 更新至 2022.06.27 编译的 R22.6.16 5.15.50"
echo
TIME g "[4] 更新至 2022.07.07 编译的 R22.7.7  5.15.52 Cpu:19377"
echo
TIME g "[5] 更新至 2022.08.05 编译的 R22.8.2  5.15.59 Cpu:19388"
echo
TIME r "[0] 退出更新"
echo
read -p " 输入 序号 然后 敲回车确认 请输入您的选择： " CHOOSE
case $CHOOSE in
1)
echo
TIME g "【2022.05.23 更新日志】"
TIME g "1.同步编译源码库到固件更新当天 "
TIME g "2.固件版本更新 R22.5.5 内核更新 5.15.41"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.0.1/Phicomm-N1_OP-R22.5.5_5.15.41.tar.xz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4                        #升级脚本 存在 则复制到mmcblk2p4录目
else                                                       #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://raw.githubusercontent.com/hm-Private/OpenWrt/main/update.sh
fi
if [ -f "/etc/flippy-openwrt-release" ]; then              #判断 flippy-openwrt-release 文件是否存在
mv -f /etc/flippy-openwrt-release /etc/openwrt-release     #存在 则改名为 openwrt-release
sed -i 's/s905d/Phicomm/g' /etc/openwrt-release            #修改 SOC
sed -i 's/n1/N1/g' /etc/openwrt-release                    #修改 BOARD
fi    
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url/$Firmware
TIME g "===============================下载完成,解压中==============================="
tar -xvJf *tar.xz && rm -f *.tar.xz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
2)
echo
TIME g "【2022.06.19 更新日志】"
TIME g "1.同步编译源码库到固件更新当天 "
TIME g "2.固件版本更新 R22.6.16 内核更新 5.15.48"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.0.1/Phicomm-N1_OP-R22.6.16_5.15.48.tar.xz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4                        #升级脚本 存在 则复制到mmcblk2p4录目
else                                                       #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://raw.githubusercontent.com/hm-Private/OpenWrt/main/update.sh
fi
if [ -f "/etc/flippy-openwrt-release" ]; then              #判断 flippy-openwrt-release 文件是否存在
mv -f /etc/flippy-openwrt-release /etc/openwrt-release     #存在 则改名为 openwrt-release
sed -i 's/s905d/Phicomm/g' /etc/openwrt-release            #修改 SOC
sed -i 's/n1/N1/g' /etc/openwrt-release                    #修改 BOARD
fi    
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url
TIME g "===============================下载完成,解压中==============================="
tar -xvJf *tar.xz && rm -f *.tar.xz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
3)
echo
TIME g "【2022.06.27 更新日志】"
TIME g "1.同步编译源码库到固件更新当天 "
TIME g "2.固件版本更新 R22.6.16 内核更新 5.15.50"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.0.1/Phicomm-N1_OP-R22.6.16_5.15.50.tar.xz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4                        #升级脚本 存在 则复制到mmcblk2p4录目
else                                                       #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://raw.githubusercontent.com/hm-Private/OpenWrt/main/update.sh
fi
if [ -f "/etc/flippy-openwrt-release" ]; then              #判断 flippy-openwrt-release 文件是否存在
mv -f /etc/flippy-openwrt-release /etc/openwrt-release     #存在 则改名为 openwrt-release
sed -i 's/s905d/Phicomm/g' /etc/openwrt-release            #修改 SOC
sed -i 's/n1/N1/g' /etc/openwrt-release                    #修改 BOARD
fi    
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url
TIME g "===============================下载完成,解压中==============================="
tar -xvJf *tar.xz && rm -f *.tar.xz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
4)
echo
TIME g "【2022.07.07 更新日志】"
TIME g "1.同步编译源码库到固件更新当天 "
TIME g "2.固件版本更新 R22.7.7 内核更新 5.15.52"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.0.1/Phicomm-N1_OP-R22.7.7_5.15.52.tar.xz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4                        #升级脚本 存在 则复制到mmcblk2p4录目
else                                                       #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://raw.githubusercontent.com/hm-Private/OpenWrt/main/update.sh
fi
if [ -f "/etc/flippy-openwrt-release" ]; then              #判断 flippy-openwrt-release 文件是否存在
mv -f /etc/flippy-openwrt-release /etc/openwrt-release     #存在 则改名为 openwrt-release
sed -i 's/s905d/Phicomm/g' /etc/openwrt-release            #修改 SOC
sed -i 's/n1/N1/g' /etc/openwrt-release                    #修改 BOARD
fi    
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url
TIME g "===============================下载完成,解压中==============================="
tar -xvJf *tar.xz && rm -f *.tar.xz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
5)
echo
TIME g "【2022.08.05 更新日志】"
TIME g "1.同步编译源码库到固件更新当天 "
TIME g "2.固件版本更新 R22.8.2 内核更新 5.15.59"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.0.1/Phicomm-N1_OP-R22.8.2_5.15.59.tar.xz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4                        #升级脚本 存在 则复制到mmcblk2p4录目
else                                                       #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://raw.githubusercontent.com/hm-Private/OpenWrt/main/update.sh
fi
if [ -f "/etc/flippy-openwrt-release" ]; then              #判断 flippy-openwrt-release 文件是否存在
mv -f /etc/flippy-openwrt-release /etc/openwrt-release     #存在 则改名为 openwrt-release
sed -i 's/s905d/Phicomm/g' /etc/openwrt-release            #修改 SOC
sed -i 's/n1/N1/g' /etc/openwrt-release                    #修改 BOARD
fi    
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url
TIME g "===============================下载完成,解压中==============================="
tar -xvJf *tar.xz && rm -f *.tar.xz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
0)
echo
TIME r "已退出本次更新"
echo
exit 0
break
;;
*)
echo
TIME r "请输入正确的序号!"
;;
esac
done
