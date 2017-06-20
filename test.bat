set MRUBY_CONFIG=../mruby_build_config/msvc_mgem_build_config.rb

pushd ..\mruby
ruby minirake clean
ruby minirake all test
popd
