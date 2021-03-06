#
#  Copyright (c) 2019            Jeong Han Lee
#  Copyright (c) 2017 - 2019     European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Wednesday, September 25 09:50:18 CEST 2019
# version : 0.0.5
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif

ifneq ($(strip $(MOTOR_DEP_VERSION)),)
motor_VERSION=$(MOTOR_DEP_VERSION)
endif

APP:=EthercatMCApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src

USR_INCLUDES += -I$(where_am_I)$(APPSRC)

TEMPLATES += $(wildcard $(APPDB)/*.template)

SOURCES += $(APPSRC)/EthercatMCADS.cpp
SOURCES += $(APPSRC)/EthercatMCAxis.cpp
SOURCES += $(APPSRC)/EthercatMCController.cpp
SOURCES += $(APPSRC)/EthercatMCHelper.cpp
SOURCES += $(APPSRC)/EthercatMCIndexerAxis.cpp
SOURCES += $(APPSRC)/EthercatMCIndexer.cpp

DBDS    += $(APPSRC)/EthercatMcSupport.dbd

SCRIPTS += $(wildcard ./iocsh/*.iocsh)

.PHONY: vlibs db

db:

vlibs:
#
