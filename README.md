# Ubuntu-Ultra96
## Overview
### Introduction
ikwzmさんが公開されているUltra96/Ultra96-V2用のLinux Boot Imageを再現したものです。Boot Loaderがboot.binにまとめられる前の各ファイルがほしかったので、ikwzmさんの記事を参考に作りました。

### Original Project
https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04-Ultra96

### reference
https://qiita.com/ikwzm/items/5ae07792143d8018bfea

## How to use
### git clone
```
$ git clone --depth=1 --branch v2020.2-console-Ultra96-V2 https://github.com/ksksho/Ubuntu-Ultra96.git
$ cd Ubuntu-Ultra96
$ git lfs pull
```

### generate boot.bin
1. boot.bifファイルを作成。
2. vivadoのbootgenコマンドによりboot.binを作成
```
$ source /tools/Xilinx/Vitis/2021.1/settings64.sh
$ cd target/ultra96v2
$ bootgen -arch zynqmp -image boot.bif -w -o ../boot/boot.bin
```

### install to SD-card
https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04-Ultra96/blob/main/doc/install/ultra96v2-desktop.md

## Source of files
### clone files
- bl31.elf  
	URL: https://github.com/Xilinx/arm-trusted-firmware.git  
	branch: xlnx_rebase_v2.2  
- u-boot.elf  
	URL: https://github.com/ikwzm/ZynqMP-U-Boot-Ultra96-V2.git  
	branch: build-v2019.2  
	URL: https://github.com/ikwzm/ZynqMP-U-Boot-Ultra96.git  
	branch: master  
- Linux Kernel  
	URL: https://github.com/ikwzm/ZynqMP-FPGA-Linux  
	branch: build-v2020.2  
	Note: edit uEnv.txt  
	[Change system console](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04-Ultra96/blob/main/doc/faq/change_system_console.md)  
	[Change boot runlevel](https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04-Ultra96/blob/main/doc/faq/change_boot_runlevel.md)  
- Ubuntu 20.04 Console RootFS  
	URL: https://github.com/ikwzm/ZynqMP-FPGA-Ubuntu20.04-Ultra96y.git  
	branch: v2020.2-console  

### build files
- Ultra96-V2-fpga.bit  
	Software: Vivado 2021.1  
- fsbl.elf   
	Software: Vitis 2021.1  
	CPU: psu_cortexa53_0  
	OS: standalone  
	Template: Zynq MP FSBL  
- pmufw.elf  
	Software: Vitis 2021.1  
	CPU: psu_pmu_0  
	OS: standalone  
	Template: Zynq PMU Firmware  


## Explanation of Boot Loader / Linux Kernel / Root File System
https://github.com/ksksho/Ubuntu-Ultra96/blob/v2020.2-console/documents/explanation.md
