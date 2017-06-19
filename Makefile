CONFDIR = ../mruby_build_config

core:
	MRUBY_CONFIG=$(CONFDIR)/core_test_build_config.rb make -C ../mruby test

cygwin:
	MRUBY_CONFIG=$(CONFDIR)/cygwin_mgem_build_config.rb make -C ../mruby test

mac:
	MRUBY_CONFIG=$(CONFDIR)/mac_mgem_build_config.rb make -C ../mruby test

clean:
	make -C ../mruby clean

clean_mgem:
	rm -rf ../mruby/build/mrbgems/
