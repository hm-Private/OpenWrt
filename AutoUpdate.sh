#!/bin/bash

function menu()
{
cat <<EOF
`echo`
 --N1固件 更新菜单--

`echo -e "\033[32m 1. 更新 5.10 系固件 \033[0m"`

`echo -e "\033[32m 2. 更新 5.15 系固件 \033[0m"`

0. 退出 更新
EOF
echo
read -p "请输入序号：" num1
case $num1 in
    1)
    system_menu
    ;;
    2)
    server_menu
    ;;
    0)
    exit 0
    ;;
    *)
    echo -e "\033[31m err：请输入正确的序号\033[0m"
    menu
esac
}
function system_menu()
{
cat<<EOF

------- 5.10 固件在线升级降级更新 菜单 --------

`echo -e "\033[32m 1. 更新至 2022.05.23 编译的 R22.5.5  5.10.117 \033[0m"`

`echo -e "\033[32m 2. 更新至 2022.06.19 编译的 R22.6.16 5.10.123 \033[0m"`

`echo -e "\033[32m 3. 更新至 2022.06.27 编译的 R22.6.16 5.10.125 \033[0m"`

`echo -e "\033[32m 4. 更新至 2022.07.07 编译的 R22.7.7  5.10.128 \033[0m"`

`echo -e "\033[32m 5. 更新至 2022.08.05 编译的 R22.8.2  5.10.135 \033[0m"`

`echo -e "\033[32m 6. 更新至 2022.09.16 编译的 R22.9.1  5.10.142 Cpu:19615 \033[0m"`

0. 不更了 退出本次更新

EOF
read -p "请输入序号: " num2
case $num2 in
1)
echo
echo -e "【2022.05.23 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本 R22.5.5 内核更新 5.10.117"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.02/Phicomm-N1_OP-R22.5.5_5.10.117.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
2)
echo
echo -e "【2022.06.19 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本 R22.6.16 内核更新 5.10.123"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.02/Phicomm-N1_OP-R22.6.16_5.10.123.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
3)
echo
echo -e "【2022.06.27 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本 R22.6.16 内核更新 5.10.125"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.02/Phicomm-N1_OP-R22.6.16_5.10.125.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
4)
echo
echo -e "【2022.07.07 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本 R22.7.7 内核更新 5.10.128"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.02/Phicomm-N1_OP-R22.7.7_5.10.128.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
5)
echo
echo -e "【2022.08.05 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本 R22.8.2 内核更新 5.10.135"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.02/Phicomm-N1_OP-R22.8.2_5.10.135.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
6)
echo
echo -e "【2022.09.16 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本 R22.9.1 内核更新 5.10.142"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.02/Phicomm-N1_OP-R22.9.1_5.10.142.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
0)
exit 0
;;
*)
echo -e "请输入正确序号"
system_menu
esac
}
function server_menu()
{
cat<<EOF

---- 5.15 固件在线升级降级更新 菜单 -----

`echo -e "\033[32m 1. 更新至 2022.05.23 编译的 R22.5.5  5.15.41 \033[0m"`

`echo -e "\033[32m 2. 更新至 2022.06.19 编译的 R22.6.16 5.15.48 \033[0m"`

`echo -e "\033[32m 3. 更新至 2022.06.27 编译的 R22.6.16 5.15.50 \033[0m"`

`echo -e "\033[32m 4. 更新至 2022.07.07 编译的 R22.7.7  5.15.52 Cpu:19377 \033[0m"`

`echo -e "\033[32m 5. 更新至 2022.08.05 编译的 R22.8.2  5.15.59 Cpu:19388 \033[0m"`

`echo -e "\033[32m 6. 更新至 2022.09.16 编译的 R22.9.1  5.15.67 Cpu:19631\033[0m"`

0. 不更了 退出更新

EOF
read -p "请输入编号: " num3
case $num3 in
1)
echo
echo -e "【2022.05.23 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本更新 R22.5.5 内核更新 5.15.41"
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
2)
echo
echo -e "【2022.06.19 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本更新 R22.6.16 内核更新 5.15.48"
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
3)
echo
echo -e "【2022.06.27 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本更新 R22.6.16 内核更新 5.15.50"
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
4)
echo
echo -e "【2022.07.07 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本更新 R22.7.7 内核更新 5.15.52"
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
5)
echo
echo -e "【2022.08.05 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本更新 R22.8.2 内核更新 5.15.59"
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
6)
echo
echo -e "【2022.09.16 更新】"
echo -e "1.同步编译源码库到固件发布当天"
echo -e "2.固件版本更新 2022.09.16 编译的 R22.9.1 5.15.67"
cd /mnt/mmcblk2p4
rm -rf *.sh Phicomm-N1_*
url=https://github.com/hm-Private/OpenWrt/releases/download/v0.0.0.1/Phicomm-N1_OP-R22.9.1_5.15.67.tar.xz
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
echo -e "================================ 下载固件中 ==================================="
curl -LO $url
echo -e "===============================下载完成,解压中 ================================"
tar -xvJf *tar.xz && rm -f *.tar.xz
echo -e "============================解压完成,开始升级固件============================="
chmod 755 update.sh
bash update.sh *.img
break
;;
0)
exit 0
;;
*)
echo -e "请输入正确序号"
system_menu
esac
}
menu
