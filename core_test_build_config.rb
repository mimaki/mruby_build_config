MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  enable_debug

  # Use mrbgems
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :core => 'mruby-eval'
  # conf.gem :mgem => 'mruby-io'
  # conf.gem :github => 'iij/mruby-io'
  # conf.gem :git => 'git@github.com:iij/mruby-io.git', :branch => 'master', :options => '-v'

  # include the default GEMs
  conf.gembox 'default'
  # C compiler settings
  # conf.cc do |cc|
  #   cc.command = ENV['CC'] || 'gcc'
  #   cc.flags = [ENV['CFLAGS'] || %w()]
  #   cc.include_paths = ["#{root}/include"]
  #   cc.defines = %w(DISABLE_GEMS)
  #   cc.option_include_path = '-I%s'
  #   cc.option_define = '-D%s'
  #   cc.compile_options = "%{flags} -MMD -o %{outfile} -c %{infile}"
  # end

  # mrbc settings
  # conf.mrbc do |mrbc|
  #   mrbc.compile_options = "-g -B%{funcname} -o-" # The -g option is required for line numbers
  # end

  # Linker settings
  # conf.linker do |linker|
  #   linker.command = ENV['LD'] || 'gcc'
  #   linker.flags = [ENV['LDFLAGS'] || []]
  #   linker.flags_before_libraries = []
  #   linker.libraries = %w()
  #   linker.flags_after_libraries = []
  #   linker.library_paths = []
  #   linker.option_library = '-l%s'
  #   linker.option_library_path = '-L%s'
  #   linker.link_options = "%{flags} -o %{outfile} %{objs} %{libs}"
  # end

  # Archiver settings
  # conf.archiver do |archiver|
  #   archiver.command = ENV['AR'] || 'ar'
  #   archiver.archive_options = 'rs %{outfile} %{objs}'
  # end

  # Parser generator settings
  # conf.yacc do |yacc|
  #   yacc.command = ENV['YACC'] || 'bison'
  #   yacc.compile_options = '-o %{outfile} %{infile}'
  # end

  # gperf settings
  # conf.gperf do |gperf|
  #   gperf.command = 'gperf'
  #   gperf.compile_options = '-L ANSI-C -C -p -j1 -i 1 -g -o -t -N mrb_reserved_word -k"1,3,$" %{infile} > %{outfile}'
  # end

  # file extensions
  # conf.exts do |exts|
  #   exts.object = '.o'
  #   exts.executable = '' # '.exe' if Windows
  #   exts.library = '.a'
  # end

  # file separetor
  # conf.file_separator = '/'

  # bintest
  # conf.enable_bintest
end

MRuby::Build.new('host-debug') do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  enable_debug

  # include the default GEMs
  conf.gembox 'default'

  # C compiler settings
  conf.cc.defines = %w(MRB_ENABLE_DEBUG_HOOK)

  # Generate mruby debugger command (require mruby-eval)
  conf.gem :core => "mruby-bin-debugger"

  # bintest
  conf.enable_bintest
end

MRuby::Build.new('test') do |conf|
  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  enable_debug
  conf.enable_bintest
  conf.enable_test

  conf.gembox 'default'
end

MRuby::Build.new('test-full-core') do |conf|
  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  enable_debug
  conf.enable_bintest
  conf.enable_test

  conf.gembox 'full-core'
end

[
  %w(MRB_USE_FLOAT),
  %w(MRB_INT16),
  %w(MRB_INT64),
  %w(MRB_NAN_BOXING),
  %w(MRB_WORD_BOXING),
  %w(MRB_UTF8_STRING),
  %w(MRB_FUNCALL_ARGC_MAX=8),
  %w(MRB_HEAP_PAGE_SIZE=256),
  %w(MRB_USE_IV_SEGLIST),
  %w(MRB_IVHASH_INIT_SIZE=4),
  # %w(MRB_USE_ETEXT_EDATA),                          # msys NG
  # %w(MRB_USE_ETEXT_EDATA MRB_NO_INIT_ARRAY_START),  # msys NG
  %w(MRB_GC_TURN_OFF_GENERATIONAL),
  %w(KHASH_DEFAULT_SIZE=16),
  %w(POOL_ALIGNMENT=1),
  %w(POOL_PAGE_SIZE=1024),
  %w(MRB_STR_BUF_MIN_SIZE=32),
  %w(MRB_GC_ARENA_SIZE=50),
  %w(MRB_GC_FIXED_ARENA),
  %w(MRB_FIXED_STATE_ATEXIT_STACK_SIZE=3),
  %w(MRB_FIXED_STATE_ATEXIT_STACK),
  # %w(MRB_DISABLE_STDIO),  # fail mrbc
  %w(MRB_ENABLE_DEBUG_HOOK),
  %w( MRB_USE_FLOAT
      MRB_WORD_BOXING
      MRB_UTF8_STRING
      MRB_FUNCALL_ARGC_MAX=8
      MRB_HEAP_PAGE_SIZE=256
      MRB_USE_IV_SEGLIST
      MRB_NO_INIT_ARRAY_START
      MRB_GC_TURN_OFF_GENERATIONAL
      KHASH_DEFAULT_SIZE=16
      POOL_ALIGNMENT=1
      POOL_PAGE_SIZE=1024
      MRB_STR_BUF_MIN_SIZE=32
      MRB_GC_ARENA_SIZE=50
      MRB_GC_FIXED_ARENA
      MRB_FIXED_STATE_ATEXIT_STACK_SIZE=3
      MRB_ENABLE_DEBUG_HOOK),
  %w( MRB_NAN_BOXING
      MRB_UTF8_STRING
      MRB_FUNCALL_ARGC_MAX=8
      MRB_HEAP_PAGE_SIZE=256
      MRB_IVHASH_INIT_SIZE=4
      MRB_NO_INIT_ARRAY_START
      MRB_GC_TURN_OFF_GENERATIONAL
      KHASH_DEFAULT_SIZE=16
      POOL_ALIGNMENT=1
      POOL_PAGE_SIZE=1024
      MRB_STR_BUF_MIN_SIZE=32
      MRB_GC_ARENA_SIZE=50
      MRB_GC_FIXED_ARENA
      MRB_FIXED_STATE_ATEXIT_STACK_SIZE=3
      MRB_ENABLE_DEBUG_HOOK)
].each {|defines|
  MRuby::Build.new("test-#{defines.join('-').gsub('MRB_', '')[0,32]}") do |conf|
    if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
      toolchain :visualcpp
    else
      toolchain :gcc
    end
    conf.cc.defines = defines
    enable_debug
    conf.enable_bintest
    conf.enable_test
    conf.gembox 'full-core'
  end
}

MRuby::Build.new('bench') do |conf|
  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
    conf.cc.flags << '-O3'
  end

  conf.gembox 'default'
end

# Define cross build settings
# MRuby::CrossBuild.new('32bit') do |conf|
#   toolchain :gcc
#
#   conf.cc.flags << "-m32"
#   conf.linker.flags << "-m32"
#
#   conf.build_mrbtest_lib_only
#
#   conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
#
#   conf.test_runner.command = 'env'
#
# end
