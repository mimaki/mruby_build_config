CONFDIR = ../mruby_build_config

core:
	MRUBY_CONFIG=$(CONFDIR)/core_test_build_config.rb make -C ../mruby test

msvc:
	MRUBY_CONFIG=$(CONFDIR)/msvc_mgem_build_config.rb make -C ../mruby test

mingw:
	MRUBY_CONFIG=$(CONFDIR)/mingw_mgem_build_config.rb make -C ../mruby test

cygwin:
	MRUBY_CONFIG=$(CONFDIR)/cygwin_mgem_build_config.rb make -C ../mruby test

winbash:
	MRUBY_CONFIG=$(CONFDIR)/winbash_mgem_build_config.rb make -C ../mruby test

mac:
	MRUBY_CONFIG=$(CONFDIR)/mac_mgem_build_config.rb make -C ../mruby test

linux:
	MRUBY_CONFIG=$(CONFDIR)/linux_mgem_build_config.rb make -C ../mruby test

init:
	rm -rf ../mruby/build/test-*

clean:
	make -C ../mruby clean

clean_mgem:
	rm -rf ../mruby/build/repos/
