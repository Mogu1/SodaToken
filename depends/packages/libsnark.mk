package=libsnark
$(package)_download_path=https://github.com/BinaryOmen/$(package)/releases/download/v20180117/
$(package)_file_name=$(package)-$($(package)_git_commit).tar.gz

$(package)_sha256_hash=66540a5b8ad712b5c47b008a957eaad03d77ef30bb4d15d6b9590dabe1948b50
$(package)_git_commit=9e6b19ff15bc19fba5da1707ba18e7f160e5ed07

define $(package)_set_vars
    $(package)_build_env=CC="$($(package)_cc)" CXX="$($(package)_cxx)"
    $(package)_build_env+=CXXFLAGS="$($(package)_cxxflags) -DBINARY_OUTPUT -DSTATICLIB -DNO_PT_COMPRESSION=1 "
endef

$(package)_dependencies=libgmp libsodium

define $(package)_preprocess_cmds
  cmake .
endef

define $(package)_build_cmds
  CXXFLAGS="-fPIC -DBINARY_OUTPUT -DNO_PT_COMPRESSION=1" $(MAKE) DEPINST=$(host_prefix) CURVE=ALT_BN128 MULTICORE=1 NO_PROCPS=1 NO_GTEST=1 NO_DOCS=1 STATIC=1 NO_SUPERCOP=1 FEATUREFLAGS=-DMONTGOMERY_OUTPUT OPTFLAGS="-O2"
endef

define $(package)_stage_cmds
    $(MAKE) install STATIC=1 DEPINST=$(host_prefix) PREFIX=$($(package)_staging_dir)$(host_prefix) CURVE=ALT_BN128 NO_SUPERCOP=1
endef
