#
# This file is part of HiKoB Openlab. 
# 
# HiKoB Openlab is free software: you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public License
# as published by the Free Software Foundation, version 3.
# 
# HiKoB Openlab is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with HiKoB Openlab. If not, see
# <http://www.gnu.org/licenses/>.
#
# Copyright (C) 2011 HiKoB.
#

set(CMAKE_C_COMPILER   "arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++")
set(CMAKE_OBJDUMP      "arm-none-eabi-objdump")
set(CMAKE_AR           "arm-none-eabi-ar")
set(CMAKE_RANLIB       "arm-none-eabi-ranlib")
set(CMAKE_OBJCOPY      "arm-none-eabi-objcopy")

# FreeRTOS port
set(FREERTOS_PORT "ARM_CM3")
set(FREERTOS_MEMMANG heap_1)

# GCC target specific flags
set(MY_C_FLAGS   "${MY_C_FLAGS} -DGCC_ARMCM3")

# If RELEASE is not set, set the debug option to gcc
if(RELEASE EQUAL 0)
	set(MY_C_FLAGS "${MY_C_FLAGS} -gdwarf-2")
endif(RELEASE EQUAL 0)

set(MY_C_FLAGS   "${MY_C_FLAGS} -fno-builtin -fsingle-precision-constant")
set(MY_C_FLAGS   "${MY_C_FLAGS} -mcpu=cortex-m3 -mthumb -mthumb-interwork -mfix-cortex-m3-ldrd -msoft-float")
set(MY_C_FLAGS   "${MY_C_FLAGS} -ffunction-sections -fdata-sections -Wl,--gc-sections")

# LD target specific flags
set(MY_LD_FLAGS  "${MY_LD_FLAGS} -nostartfiles -nodefaultlibs") # -lc -lm -lgcc -lstdc++
set(MY_LD_FLAGS  "${MY_LD_FLAGS} -T${PROJECT_SOURCE_DIR}/platform/${PLATFORM}/${LINKSCRIPT}")
set(MY_LD_FLAGS  "${MY_LD_FLAGS} -mcpu=cortex-m3 -mthumb -mthumb-interwork")
set(MY_LD_FLAGS  "${MY_LD_FLAGS} -ffunction-sections -fdata-sections -Wl,--gc-sections")
set(MY_LD_FLAGS  "${MY_LD_FLAGS} -Wl,-Map,${EXECUTABLE_OUTPUT_PATH}/out.map -Wl,--cref")
