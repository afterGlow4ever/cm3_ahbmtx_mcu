#===============================================
#
#		File: setenv.sh
#		Author: afterGlow,4ever
#		Group: Fall For Laboratory
#		Date: 07292023
#		Version: v1.0
#
# 	All environment needed in this whole project.
# 	Including:
# 	1. Tools update (Please not use if not using modulefiles)
#	2. Project environment variable config
#	3. Shortcut keys for this whole project 
#	4. shell cmd 'run' for running makefile in scripts
#
#===============================================

#===============================================
# tools update
# please comment all belows when you are not using module
#===============================================
module purge
module add armgcc/gcc-arm-none-eabi-10.3-2021.10/modulefile
module add quartus/2018_std/modulefile
module add spyglass/2022.06/modulefile
module add vcs/2022.06/modulefile
module add verdi/2022.06/modulefile
module add vivado/2021.1/modulefile
module list

which arm-none-eabi-gcc
which quartus
which spyglass
which vcs
which verdi
which vivado

#===============================================
# set project environment variable
#===============================================

unset LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$VCS_HOME/amd64/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$VERDI_HOME/share/PLI/VCS/linux64:$LD_LIBRARY_PATH
export VERDI_DT=$VERDI_HOME/share/PLI/VCS/linux64/novas.tab 
export VERDI_DA=$VERDI_HOME/share/PLI/VCS/linux64/pli.a

#===============================================
# below: project env cfgs
#===============================================

export PRJ_DIR=/home/master/project/cm3_ahbmtx_mcu
export PRJ_DOC_DIR=${PRJ_DIR}/doc
export PRJ_REGLIST_DIR=${PRJ_DIR}/doc/reglist
export PRJ_LIB_DIR=${PRJ_DIR}/library
export PRJ_MOD_DIR=${PRJ_DIR}/library/models
export PRJ_DRV_DIR=${PRJ_DIR}/library/drivers
export PRJ_PRJ_DIR=${PRJ_DIR}/project
export PRJ_FPGA_DIR=${PRJ_DIR}/project/fpga_syn
export PRJ_FPGA_SCR_DIR=${PRJ_DIR}/project/fpga_syn/script
export PRJ_SYN_DIR=${PRJ_DIR}/project/syn
export PRJ_SDK_DIR=${PRJ_DIR}/project/firmware_sdk
export PRJ_RTL_DIR=${PRJ_DIR}/user/verilog
export PRJ_FPGA_RTL_DIR=${PRJ_DIR}/user/fpga_verilog
export PRJ_FW_DIR=${PRJ_DIR}/user/firmware
export PRJ_SIM_DIR=${PRJ_DIR}/sim/verilog_sim
export PRJ_SIM_SCR_DIR=${PRJ_DIR}/sim/verilog_sim/script
export PRJ_SG_DIR=${PRJ_DIR}/sim/spyglass_prj
export PRJ_TB_DIR=${PRJ_DIR}/sim/verilog_sim/tb
export PRJ_TV_DIR=${PRJ_DIR}/sim/verilog_sim/tv
export PRJ_SCR_DIR=${PRJ_DIR}/script

#===============================================
# shortcut keys for project
#===============================================

alias cdh='cd ${PRJ_DIR}' 
alias cddc='cd ${PRJ_DOC_DIR}' 
alias cddr='cd ${PRJ_REGLIST_DIR}' 
alias cdl='cd ${PRJ_LIB_DIR}' 
alias cdm='cd ${PRJ_MOD_DIR}' 
alias cdd='cd ${PRJ_DRV_DIR}' 
alias cdp='cd ${PRJ_PRJ_DIR}' 
alias cdq='cd ${PRJ_FPGA_DIR}' 
alias cdqs='cd ${PRJ_FPGA_SCR_DIR}' 
alias cdsy='cd ${PRJ_SYN_DIR}' 
alias cdf='cd ${PRJ_SDK_DIR}' 
alias cdv='cd ${PRJ_RTL_DIR}' 
alias cdqv='cd ${PRJ_FPGA_RTL_DIR}' 
alias cdfw='cd ${PRJ_FW_DIR}' 
alias cds='cd ${PRJ_SIM_DIR}' 
alias cdts='cd ${PRJ_SIM_SCR_DIR}' 
alias cdsg='cd ${PRJ_SG_DIR}' 
alias cdtb='cd ${PRJ_TB_DIR}' 
alias cdtv='cd ${PRJ_TV_DIR}' 
alias cdc='cd ${PRJ_SCR_DIR}' 

#===============================================
# function 'run' for running makefile in scripts
#===============================================

function run()
{
	cd ${PRJ_SCR_DIR}
	make $1
	cd -
}

