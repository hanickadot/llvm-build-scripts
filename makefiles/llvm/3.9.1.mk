llvm-true-version := 3.9.1
llvm-svn-url := https://llvm.org/svn/llvm-project
llvm-svn-tag := tags/RELEASE_391/final
llvm-svn-revision := 291446
llvm-cache-id := $(call get-svn-cache-id)

.PHONY: sources

sources: \
	$(llvm-cache-id)/llvm/.stamp \
	$(llvm-cache-id)/llvm/tools/clang/.stamp \
	$(llvm-cache-id)/llvm/tools/clang/tools/extra/.stamp \
	$(llvm-cache-id)/llvm/projects/compiler-rt/.stamp \
	$(llvm-cache-id)/llvm/projects/libcxxabi/.stamp \
	$(llvm-cache-id)/llvm/projects/libcxx/.stamp \
	$(llvm-cache-id)/llvm/projects/lldb/.stamp \
	$(llvm-cache-id)/llvm/projects/lld/.stamp

$(llvm-cache-id)/llvm/.stamp: $(cache)
	$(call llvm-svn-download,llvm,llvm)
	
$(llvm-cache-id)/llvm/tools/clang/.stamp: $(llvm-cache-id)/llvm/.stamp
	$(call llvm-svn-download,cfe,llvm/tools/clang)
	
$(llvm-cache-id)/llvm/tools/clang/tools/extra/.stamp: $(llvm-cache-id)/llvm/tools/clang/.stamp
	$(call llvm-svn-download,clang-tools-extra,llvm/tools/clang/tools/extra)

$(llvm-cache-id)/llvm/projects/compiler-rt/.stamp: $(llvm-cache-id)/llvm/.stamp
	$(call llvm-svn-download,compiler-rt,llvm/projects/compiler-rt)

$(llvm-cache-id)/llvm/projects/libcxxabi/.stamp: $(llvm-cache-id)/llvm/.stamp
	$(call llvm-svn-download,libcxxabi,llvm/projects/libcxxabi)

$(llvm-cache-id)/llvm/projects/libcxx/.stamp: $(llvm-cache-id)/llvm/.stamp
	$(call llvm-svn-download,libcxx,llvm/projects/libcxx)

$(llvm-cache-id)/llvm/projects/lldb/.stamp: $(llvm-cache-id)/llvm/.stamp
	$(call llvm-svn-download,lldb,llvm/projects/lldb)
	
$(llvm-cache-id)/llvm/projects/lld/.stamp: $(llvm-cache-id)/llvm/.stamp
	$(call llvm-svn-download,lld,llvm/projects/lld)
