# Build LLVM for CentOS 6/7 in docker.

override MAKEFILE_PATH_SYSTEMS := makefiles/systems
override MAKEFILE_PATH_LLVM := makefiles/llvm
override MAKEFILE_PATH_SUPPORT := makefiles/support

llvm := latest-stable
system := centos6

.PHONY: all id help clean clean-cache

all: 
	@echo "hi"

help:
	@echo "You need to specify system for which you want to build RPMs (system):"
	@echo $(patsubst $(MAKEFILE_PATH_SYSTEMS)/%.mk,%,$(wildcard $(MAKEFILE_PATH_SYSTEMS)/*.mk))
	@echo "And choose version of LLVM (llvm):"
	@echo $(patsubst $(MAKEFILE_PATH_LLVM)/%.mk,%,$(wildcard $(MAKEFILE_PATH_LLVM)/*.mk))
	
-include $(wildcard $(MAKEFILE_PATH_SUPPORT)/*.mk)
include makefiles/llvm/$(llvm).mk
include makefiles/systems/$(system).mk

id:
	@echo "LLVM: $(llvm-true-version)"
	@echo "system: $(system)"
	
clean-cache:
	rm -rf $(CACHE_PATH)