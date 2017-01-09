svn-cache-id = $(CACHE_PATH)/$(subst /,-,$(1))-$(2)
get-svn-cache-id = $(call svn-cache-id,$(llvm-svn-tag),$(llvm-svn-revision))

CACHE_PATH := ${CURDIR}/source_cache

cache := $(CACHE_PATH)/.stamp

$(cache):
	mkdir -p $(CACHE_PATH)
	touch $@
