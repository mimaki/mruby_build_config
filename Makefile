.phony: core

core:
	MRUBY_CONFIG=../mruby_build_config/core_test_build_config.rb make -C ../mruby test

clean:
	mruby -C ../mruby clean
