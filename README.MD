一	工程项目：
1	项目名称：cm3_ahbmtx_mcu
2	项目使用的资源与软件：
(1)	VCS-2022
(2)	Verdi-2022
(3)	gcc-arm-none-eabi v10.3-2021.10
(4)	Quartus Prime 2018
(5)	Vivado 2021.1
(6)	Spyglass-2021
3	项目使用的资源与硬件：
(1)	ep4ce55的ad9361开发板及usb-blaster下载器
(2)	正点原子zynq领航者开发板及xilinx下载器
(3)	Jlink盒子

二	工程目标：
1	实验现象：
(1)	搭建一个使用ARM Cortex-M3为CPU、AHB总线矩阵为基础的MCU。
(2)	使用Jlink的SWD模式可以正确地读写指定地址。
(3)	使用Jlink的SWD模式可以正确地读写SRAM。
(4)	当CPU开始运行时可运行在ITCM中存放的bootloader。
(5)	CPU可以正确驱动Uart输入、输出。
2	实验内容：
(1)	在MCU内集成CPU、总线、存储器、外设等。
(2)	使用Jlink的SWD模式读写指定地址。
(3)	使用Jlink的SWD模式读写SRAM。
(4)	ITCM中存放一个bootloader。
(5)	使用CPU驱动Uart，完成输入、输出功能的实现。
3	具体要求：
(1)	CPU使用ARM Cortex-M3。
(2)	片内总线使用AHB总线矩阵。
(3)	使用异步AHB2APB桥。
(4)	使用SWD模型读写寄存器并进行仿真。
(5)	分别使用RTL和FPGA IP实现SRAM并进行读写操作仿真。
(6)	在ITCM中存放一个bootloader，当CPU开始运行时即运行该程序。
(7)	根据Uart的RTL功能，编写配套的firmware驱动并实现输入、输出的功能。

三	学习目标（下述内容非先后顺序）：
1	学习MCU的基本架构。
(1)	了解MCU内部的基本架构。
(2)	掌握MCU的集成方式。
(3)	掌握MCU的仿真环境与Testbench、激励的编写。
2	学习ARM Cortex-M3为CPU：
(1)	了解ARM Cortex-M3为CPU的基本功能和接口。
(2)	掌握ARM Cortex-M3为CPU如何和总线进行链接。
(3)	掌握ARM Cortex-M3为CPU与SWD的链接方式。
(4)	掌握ARM Cortex-M3为CPU如何连接时钟信号和复位信号。
3	学习AHB总线矩阵：
(1)	了解AHB总线矩阵的基本读写时序。
(2)	了解AHB总线矩阵的生成。
(3)	掌握AHB总线矩阵与CPU、AHB2APB桥、外设的连接方式。
(4)	掌握AHB总线矩阵如何连接时钟信号和复位信号。
4	学习AHB2APB桥和APB总线：
(1)	了解同步和异步AHB2APB桥的基本读写时序。
(2)	了解APB总线的基本读写时序。
(3)	掌握同步和异步AHB2APB桥和AHB总线矩阵、APB总线的连接方式。
(4)	掌握APB总线如何连接时钟信号和复位信号。
(5)	掌握APB总线如何连接外设（寄存器）。
5	学习SWD时序与JTAG使用方法：
(1)	了解SWD的基本工作原理与模型。
(2)	掌握SWD读写指定地址的操作方法。
(3)	掌握使用Jlink的SWD模式读写指定地址。
6	学习SRAM：
(1)	掌握SRAM读写接口与时序。
(2)	掌握SRAM的RTL实现和FPGA IP核实现。
7	学习bootloader：
(1)	了解什么是bootloader。
(2)	掌握bootloader的firmware的用法。
8	学习Uart：
(1)	学习Uart及其通信协议。
(2)	学习Uart的硬件RTL实现。
(3)	对Uart进行功能测试和spyglass检查，修改其中的错误和问题。
(4)	学习Uart的软件驱动编写。
(5)	掌握如何使用Uart并实现特定的功能。
9	学习VCS与Verdi联合仿真环境：
(1)	掌握如何使用VCS进行仿真并使用Verdi记录波形。
10	学习gcc-arm-none-eabi编译firmware环境：
(1)	掌握如何使用gcc-arm-none-eabi编一个cpu可执行的程序。
11	学习Quartus和Vivado的fpga综合编译环境：
(1)	掌握如何使用Quartus和Vivado生成或修改IP核，包括RAM核和PLL核。
(2)	掌握如何使用Quartus和Vivado进行fpga综合并下载bit文件。
(3)	掌握如何使用Quartus和Vivado进行在线debug。
(4)	掌握如何使用Quartus和Vivado编写时序约束文件并进行时序分析。
(5)	掌握如何使用Quartus和Vivado进行ECO操作。
12	学习spyglass环境：
(1)	掌握如何编写sgdc约束文件。
(2)	掌握如何使用spyglass进行语法和cdc分析。
(3)	了解根据spyglass的分析结果对于rtl的意义。

四	可以重复利用的资源：
1	工程项目目录下Library下面的内容，包括Altera及Xilinx的部分仿真库、基本功能逻辑RTL的实现、Cortex-M3的建议版本模型、CMSDK模型（包括AHB总线矩阵、APB总线）、SWD模型、仿真结果监视器模型等。
2	工程项目目录下User\Verilog，这里是MCU的基本集成结构。
3	便于使用者进行工作的“爱上实验室”开发工程环境，包含setenv.sh文件和Script目录下的makefile文件。

五	注意事项：
1	该项目会持续更新。
2	小编时间仓促，因此项目中有不完善的地方敬请大家提出建议。
3	硬件学习交流群1126635164。

六	“爱上实验室”开发工程环境的目录介绍：
项目目录下，各文件夹的含义是（含空文件夹，加粗的是本项目包含的文件）：
Doc目录为项目文档，包括参考资料、设计文档、原理图等。
Library目录为项目所使用到的库文件，包括仿真库、Monitor、Model等。
Project目录为项目所涉及到的工程，包括arm-none-eabi工程、fpga工程等。
Script目录包含“爱上实验室”开发工程环境专用的脚本、功能等。
Sim目录为项目包含的仿真的目录，包含仿真工程、spyglass工程、testbench、激励文件、脚本等、以及仿真专用代码、脚本等。
User目录包含用户主要的项目文件，包含rtl代码、bootloader等。

目前最适合的使用方法是在Linux环境下运行，很多脚本方便使用，可以体会到“爱上实验室”开发工程环境的便利。使用者只需根据自己的环境配置setenv.sh文件即可，默认使用的是modulefiles模块管理eda工具。

Source setenv.sh后：
快捷键可以进行目录跳转，常见的例如：
cdc跳转至开发环境专用脚本目录；
cdv跳转至verilog目录；
cdfw跳转至firmware目录；
cdq跳转至fpga目录；
cds跳转至仿真目录；
cdtv跳转至仿真测试激励目录；
cdtb跳转至仿真testbench目录等。

工程根目录下面的script文件夹里，即为“爱上实验室”开发工程环境专用的脚本、功能，目前包括以下种类：
RTL功能仿真；
带firmware程序的RTL仿真；
AHB总线矩阵生成；
连接APB总线的寄存器生成；
firmware编译；
fpga综合；
带firmware的综合仿真等。
用户可以根据自己的需要，建立对应的makefile.xxxx文件，同时在总的makefile文件中加入对应的命令即可。在“爱上实验室”开发工程环境的任意目录下，使用run xxx命令，即可开始进行xxx功能的操作，例如仿真等操作。
