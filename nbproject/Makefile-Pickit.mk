#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Pickit.mk)" "nbproject/Makefile-local-Pickit.mk"
include nbproject/Makefile-local-Pickit.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Pickit
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Driver/pid.c Driver/dta_motor.c Driver/motor.c Driver/driver.c Driver/eeprom.c Driver/encoder.c Driver/ports.c Driver/pwm.c Driver/uart.c Driver/timer.c Driver/timer_asm.s Driver/adc.c Setting/configuration.c main.c Setting/types.c EShell/error.c EShell/file.c EShell/shell.c EShell/shell_bin.c EShell/shell_core.c EShell/shell_sbin.c EShell/system.c C:/Users/MORIYAMA/Documents/MDU_COMON.X/Driver/mc.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Driver/pid.o ${OBJECTDIR}/Driver/dta_motor.o ${OBJECTDIR}/Driver/motor.o ${OBJECTDIR}/Driver/driver.o ${OBJECTDIR}/Driver/eeprom.o ${OBJECTDIR}/Driver/encoder.o ${OBJECTDIR}/Driver/ports.o ${OBJECTDIR}/Driver/pwm.o ${OBJECTDIR}/Driver/uart.o ${OBJECTDIR}/Driver/timer.o ${OBJECTDIR}/Driver/timer_asm.o ${OBJECTDIR}/Driver/adc.o ${OBJECTDIR}/Setting/configuration.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Setting/types.o ${OBJECTDIR}/EShell/error.o ${OBJECTDIR}/EShell/file.o ${OBJECTDIR}/EShell/shell.o ${OBJECTDIR}/EShell/shell_bin.o ${OBJECTDIR}/EShell/shell_core.o ${OBJECTDIR}/EShell/shell_sbin.o ${OBJECTDIR}/EShell/system.o ${OBJECTDIR}/_ext/1090792012/mc.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Driver/pid.o.d ${OBJECTDIR}/Driver/dta_motor.o.d ${OBJECTDIR}/Driver/motor.o.d ${OBJECTDIR}/Driver/driver.o.d ${OBJECTDIR}/Driver/eeprom.o.d ${OBJECTDIR}/Driver/encoder.o.d ${OBJECTDIR}/Driver/ports.o.d ${OBJECTDIR}/Driver/pwm.o.d ${OBJECTDIR}/Driver/uart.o.d ${OBJECTDIR}/Driver/timer.o.d ${OBJECTDIR}/Driver/timer_asm.o.d ${OBJECTDIR}/Driver/adc.o.d ${OBJECTDIR}/Setting/configuration.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/Setting/types.o.d ${OBJECTDIR}/EShell/error.o.d ${OBJECTDIR}/EShell/file.o.d ${OBJECTDIR}/EShell/shell.o.d ${OBJECTDIR}/EShell/shell_bin.o.d ${OBJECTDIR}/EShell/shell_core.o.d ${OBJECTDIR}/EShell/shell_sbin.o.d ${OBJECTDIR}/EShell/system.o.d ${OBJECTDIR}/_ext/1090792012/mc.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Driver/pid.o ${OBJECTDIR}/Driver/dta_motor.o ${OBJECTDIR}/Driver/motor.o ${OBJECTDIR}/Driver/driver.o ${OBJECTDIR}/Driver/eeprom.o ${OBJECTDIR}/Driver/encoder.o ${OBJECTDIR}/Driver/ports.o ${OBJECTDIR}/Driver/pwm.o ${OBJECTDIR}/Driver/uart.o ${OBJECTDIR}/Driver/timer.o ${OBJECTDIR}/Driver/timer_asm.o ${OBJECTDIR}/Driver/adc.o ${OBJECTDIR}/Setting/configuration.o ${OBJECTDIR}/main.o ${OBJECTDIR}/Setting/types.o ${OBJECTDIR}/EShell/error.o ${OBJECTDIR}/EShell/file.o ${OBJECTDIR}/EShell/shell.o ${OBJECTDIR}/EShell/shell_bin.o ${OBJECTDIR}/EShell/shell_core.o ${OBJECTDIR}/EShell/shell_sbin.o ${OBJECTDIR}/EShell/system.o ${OBJECTDIR}/_ext/1090792012/mc.o

# Source Files
SOURCEFILES=Driver/pid.c Driver/dta_motor.c Driver/motor.c Driver/driver.c Driver/eeprom.c Driver/encoder.c Driver/ports.c Driver/pwm.c Driver/uart.c Driver/timer.c Driver/timer_asm.s Driver/adc.c Setting/configuration.c main.c Setting/types.c EShell/error.c EShell/file.c EShell/shell.c EShell/shell_bin.c EShell/shell_core.c EShell/shell_sbin.c EShell/system.c C:/Users/MORIYAMA/Documents/MDU_COMON.X/Driver/mc.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-Pickit.mk dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=30F4012
MP_LINKER_FILE_OPTION=,--script=p30F4012.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Driver/pid.o: Driver/pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/pid.o.d 
	@${RM} ${OBJECTDIR}/Driver/pid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/pid.c  -o ${OBJECTDIR}/Driver/pid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/pid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/pid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/dta_motor.o: Driver/dta_motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/dta_motor.o.d 
	@${RM} ${OBJECTDIR}/Driver/dta_motor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/dta_motor.c  -o ${OBJECTDIR}/Driver/dta_motor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/dta_motor.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/dta_motor.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/motor.o: Driver/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/motor.o.d 
	@${RM} ${OBJECTDIR}/Driver/motor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/motor.c  -o ${OBJECTDIR}/Driver/motor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/motor.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/motor.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/driver.o: Driver/driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/driver.o.d 
	@${RM} ${OBJECTDIR}/Driver/driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/driver.c  -o ${OBJECTDIR}/Driver/driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/eeprom.o: Driver/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/eeprom.o.d 
	@${RM} ${OBJECTDIR}/Driver/eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/eeprom.c  -o ${OBJECTDIR}/Driver/eeprom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/eeprom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/eeprom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/encoder.o: Driver/encoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/encoder.o.d 
	@${RM} ${OBJECTDIR}/Driver/encoder.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/encoder.c  -o ${OBJECTDIR}/Driver/encoder.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/encoder.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/encoder.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/ports.o: Driver/ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/ports.o.d 
	@${RM} ${OBJECTDIR}/Driver/ports.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/ports.c  -o ${OBJECTDIR}/Driver/ports.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/ports.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/ports.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/pwm.o: Driver/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/pwm.o.d 
	@${RM} ${OBJECTDIR}/Driver/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/pwm.c  -o ${OBJECTDIR}/Driver/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/uart.o: Driver/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/uart.o.d 
	@${RM} ${OBJECTDIR}/Driver/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/uart.c  -o ${OBJECTDIR}/Driver/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/timer.o: Driver/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/timer.o.d 
	@${RM} ${OBJECTDIR}/Driver/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/timer.c  -o ${OBJECTDIR}/Driver/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/adc.o: Driver/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/adc.o.d 
	@${RM} ${OBJECTDIR}/Driver/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/adc.c  -o ${OBJECTDIR}/Driver/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Setting/configuration.o: Setting/configuration.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Setting" 
	@${RM} ${OBJECTDIR}/Setting/configuration.o.d 
	@${RM} ${OBJECTDIR}/Setting/configuration.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Setting/configuration.c  -o ${OBJECTDIR}/Setting/configuration.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Setting/configuration.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Setting/configuration.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Setting/types.o: Setting/types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Setting" 
	@${RM} ${OBJECTDIR}/Setting/types.o.d 
	@${RM} ${OBJECTDIR}/Setting/types.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Setting/types.c  -o ${OBJECTDIR}/Setting/types.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Setting/types.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Setting/types.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/error.o: EShell/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/error.o.d 
	@${RM} ${OBJECTDIR}/EShell/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/error.c  -o ${OBJECTDIR}/EShell/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/error.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/error.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/file.o: EShell/file.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/file.o.d 
	@${RM} ${OBJECTDIR}/EShell/file.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/file.c  -o ${OBJECTDIR}/EShell/file.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/file.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/file.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell.o: EShell/shell.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell.c  -o ${OBJECTDIR}/EShell/shell.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell_bin.o: EShell/shell_bin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell_bin.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell_bin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell_bin.c  -o ${OBJECTDIR}/EShell/shell_bin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell_bin.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell_bin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell_core.o: EShell/shell_core.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell_core.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell_core.c  -o ${OBJECTDIR}/EShell/shell_core.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell_core.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell_core.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell_sbin.o: EShell/shell_sbin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell_sbin.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell_sbin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell_sbin.c  -o ${OBJECTDIR}/EShell/shell_sbin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell_sbin.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell_sbin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/system.o: EShell/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/system.o.d 
	@${RM} ${OBJECTDIR}/EShell/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/system.c  -o ${OBJECTDIR}/EShell/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1090792012/mc.o: C:/Users/MORIYAMA/Documents/MDU_COMON.X/Driver/mc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1090792012" 
	@${RM} ${OBJECTDIR}/_ext/1090792012/mc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1090792012/mc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Users/MORIYAMA/Documents/MDU_COMON.X/Driver/mc.c  -o ${OBJECTDIR}/_ext/1090792012/mc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1090792012/mc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1090792012/mc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/Driver/pid.o: Driver/pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/pid.o.d 
	@${RM} ${OBJECTDIR}/Driver/pid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/pid.c  -o ${OBJECTDIR}/Driver/pid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/pid.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/pid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/dta_motor.o: Driver/dta_motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/dta_motor.o.d 
	@${RM} ${OBJECTDIR}/Driver/dta_motor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/dta_motor.c  -o ${OBJECTDIR}/Driver/dta_motor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/dta_motor.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/dta_motor.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/motor.o: Driver/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/motor.o.d 
	@${RM} ${OBJECTDIR}/Driver/motor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/motor.c  -o ${OBJECTDIR}/Driver/motor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/motor.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/motor.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/driver.o: Driver/driver.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/driver.o.d 
	@${RM} ${OBJECTDIR}/Driver/driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/driver.c  -o ${OBJECTDIR}/Driver/driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/driver.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/driver.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/eeprom.o: Driver/eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/eeprom.o.d 
	@${RM} ${OBJECTDIR}/Driver/eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/eeprom.c  -o ${OBJECTDIR}/Driver/eeprom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/eeprom.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/eeprom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/encoder.o: Driver/encoder.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/encoder.o.d 
	@${RM} ${OBJECTDIR}/Driver/encoder.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/encoder.c  -o ${OBJECTDIR}/Driver/encoder.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/encoder.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/encoder.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/ports.o: Driver/ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/ports.o.d 
	@${RM} ${OBJECTDIR}/Driver/ports.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/ports.c  -o ${OBJECTDIR}/Driver/ports.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/ports.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/ports.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/pwm.o: Driver/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/pwm.o.d 
	@${RM} ${OBJECTDIR}/Driver/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/pwm.c  -o ${OBJECTDIR}/Driver/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/pwm.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/uart.o: Driver/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/uart.o.d 
	@${RM} ${OBJECTDIR}/Driver/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/uart.c  -o ${OBJECTDIR}/Driver/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/uart.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/timer.o: Driver/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/timer.o.d 
	@${RM} ${OBJECTDIR}/Driver/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/timer.c  -o ${OBJECTDIR}/Driver/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/timer.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/timer.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Driver/adc.o: Driver/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/adc.o.d 
	@${RM} ${OBJECTDIR}/Driver/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Driver/adc.c  -o ${OBJECTDIR}/Driver/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Driver/adc.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Driver/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Setting/configuration.o: Setting/configuration.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Setting" 
	@${RM} ${OBJECTDIR}/Setting/configuration.o.d 
	@${RM} ${OBJECTDIR}/Setting/configuration.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Setting/configuration.c  -o ${OBJECTDIR}/Setting/configuration.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Setting/configuration.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Setting/configuration.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/Setting/types.o: Setting/types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Setting" 
	@${RM} ${OBJECTDIR}/Setting/types.o.d 
	@${RM} ${OBJECTDIR}/Setting/types.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Setting/types.c  -o ${OBJECTDIR}/Setting/types.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Setting/types.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/Setting/types.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/error.o: EShell/error.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/error.o.d 
	@${RM} ${OBJECTDIR}/EShell/error.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/error.c  -o ${OBJECTDIR}/EShell/error.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/error.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/error.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/file.o: EShell/file.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/file.o.d 
	@${RM} ${OBJECTDIR}/EShell/file.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/file.c  -o ${OBJECTDIR}/EShell/file.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/file.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/file.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell.o: EShell/shell.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell.c  -o ${OBJECTDIR}/EShell/shell.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell_bin.o: EShell/shell_bin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell_bin.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell_bin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell_bin.c  -o ${OBJECTDIR}/EShell/shell_bin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell_bin.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell_bin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell_core.o: EShell/shell_core.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell_core.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell_core.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell_core.c  -o ${OBJECTDIR}/EShell/shell_core.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell_core.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell_core.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/shell_sbin.o: EShell/shell_sbin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/shell_sbin.o.d 
	@${RM} ${OBJECTDIR}/EShell/shell_sbin.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/shell_sbin.c  -o ${OBJECTDIR}/EShell/shell_sbin.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/shell_sbin.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/shell_sbin.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/EShell/system.o: EShell/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/EShell" 
	@${RM} ${OBJECTDIR}/EShell/system.o.d 
	@${RM} ${OBJECTDIR}/EShell/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  EShell/system.c  -o ${OBJECTDIR}/EShell/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/EShell/system.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/EShell/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1090792012/mc.o: C:/Users/MORIYAMA/Documents/MDU_COMON.X/Driver/mc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1090792012" 
	@${RM} ${OBJECTDIR}/_ext/1090792012/mc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1090792012/mc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Users/MORIYAMA/Documents/MDU_COMON.X/Driver/mc.c  -o ${OBJECTDIR}/_ext/1090792012/mc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1090792012/mc.o.d"        -g -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1090792012/mc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Driver/timer_asm.o: Driver/timer_asm.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/timer_asm.o.d 
	@${RM} ${OBJECTDIR}/Driver/timer_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  Driver/timer_asm.s  -o ${OBJECTDIR}/Driver/timer_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/Driver/timer_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/Driver/timer_asm.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/Driver/timer_asm.o: Driver/timer_asm.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Driver" 
	@${RM} ${OBJECTDIR}/Driver/timer_asm.o.d 
	@${RM} ${OBJECTDIR}/Driver/timer_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  Driver/timer_asm.s  -o ${OBJECTDIR}/Driver/timer_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  -Wa,-MD,"${OBJECTDIR}/Driver/timer_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/Driver/timer_asm.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=64,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -fast-math -DXPRJ_Pickit=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=64,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/MDU_COMON.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Pickit
	${RM} -r dist/Pickit

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
