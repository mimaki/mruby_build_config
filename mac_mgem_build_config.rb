JDK_PATH = '/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home'

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
  # conf.gembox '../../mruby_build_config/mac'
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

# MRuby::Build.new('host-debug') do |conf|
#   # load specific toolchain settings

#   # Gets set by the VS command prompts.
#   if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
#     toolchain :visualcpp
#   else
#     toolchain :gcc
#   end

#   enable_debug

#   # include the default GEMs
#   conf.gembox 'default'
#   conf.gembox '../../mruby_build_config/mac'

#   # C compiler settings
#   conf.cc.defines = %w(MRB_ENABLE_DEBUG_HOOK)

#   # Generate mruby debugger command (require mruby-eval)
#   conf.gem :core => "mruby-bin-debugger"

#   # bintest
#   # conf.enable_bintest
# end

# MRuby::Build.new('test') do |conf|
#   # Gets set by the VS command prompts.
#   if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
#     toolchain :visualcpp
#   else
#     toolchain :gcc
#   end

#   enable_debug
#   conf.enable_bintest
#   conf.enable_test

#   conf.gembox 'full-core'
#   conf.gembox '../../mruby_build_config/mac'
# end

[
=begin
  # {:git => 'https://github.com/k0u5uk3/mruby-alarm.git'}, # test crash(3)
  # {:git => 'https://github.com/cremno/mruby-allegro.git'}, # need allegro5/allegro5.h
  {:git => 'https://github.com/ppibburr/mruby-allocate.git'},
  {:git => 'https://github.com/Mav7/mruby-ansi-colors.git'},
  # {:git => 'https://github.com/jbreeden/mruby-apr.git', :flags => '-DMRB_INT64'},  # build error (mrb_ary_len)
  # {:git => 'https://github.com/kyab/mruby-arduino.git'},  # need WProgram.h
  {:git => 'https://github.com/Asmod4n/mruby-argon2.git'},
  # {:git => 'https://github.com/udzura/mruby-argtable.git'}, # need argtable3.h
  {:git => 'https://github.com/ksss/mruby-at_exit.git'},
  # {:git => 'https://github.com/georgi/mruby-audite.git'}, # need mpg123.h
  # {:git => 'https://github.com/hercules-team/mruby-augeas'},  # need augeas.h
  # {:git => 'https://github.com/randym/mruby-avl.git'}, # crach(2) forum OK {:git => 'https://github.com/mruby-Forum/mruby-avl.git', :branch => 'mruby-2.0.0-test'}
  # {:git => 'https://github.com/iij/mruby-aws-s3.git', :lib => 'pcre'},  # build error (mruby-uv)
  # {:git => 'https://github.com/hfm/mruby-aws-sigv4.git'}, # KO(1) Crash(52)
  {:git => 'https://github.com/Asmod4n/mruby-b64.git'},
  # {:git => 'https://github.com/crimsonwoods/mruby-backtrace.git'},  # build error (old mrubyVM)
  {:git => 'https://github.com/tk3/mruby-base32.git'},
  {:git => 'https://github.com/h2so5/mruby-base58.git'},
  {:git => 'https://github.com/mattn/mruby-base64.git'},
  {:git => 'https://github.com/baldowl/mruby-bcrypt.git', :incpath => '/usr/local/include', :libpath => '/usr/local/lib'}, # need onih-regexp forum
  # {:git => 'https://github.com/chasonr/mruby-bignum.git'},  # KO(1)
  # {:git => 'https://github.com/kyab/mruby-bin-mirb-hostbased.git'}, # build error: old parser
  # {:git => 'https://github.com/bovi/mruby-bin-mruby-afl.git'},  # compile error (__AFL_LOOP)
  # {:git => 'https://github.com/sdottaka/mruby-bin-scite-mruby.git'},  # no gtk/gtk.h
  # {:git => 'https://github.com/IceDragon200/mruby-blendish', :dep => ['https://github.com/IceDragon200/mruby-glew']}, # need GL/mruby-glew
  {:git => 'https://github.com/Asmod4n/mruby-c-ext-helpers.git'},
  {:git => 'https://github.com/charlescui/mruby-cache.git'},
  # {:git => 'https://github.com/matsumotory/mruby-capability.git'},  # need linux/types.h
  # {:git => 'https://github.com/pyama86/mruby-capacity.git'},  # KO(2)
  {:git => 'https://github.com/IceDragon200/mruby-catch-throw'},
  # {:git => 'https://github.com/mobiruby/mruby-cfunc.git'},  # need _rubyvm1.c
  # {:git => 'https://github.com/matsumotory/mruby-cgroup.git'},  # need libcgroup.h
  # {:git => 'https://github.com/matsumotory/mruby-changefinder.git'}, # test KO(1)
  # {:git => 'https://github.com/bggd/mruby-channel.git'},  # build error (c++11)
  # {:git => 'https://github.com/IceDragon200/mruby-chipmunk2d'}, # need chipmunk/chipmunk.h
  {:git => 'https://github.com/Asmod4n/mruby-chrono.git'},
  # {:git => 'https://github.com/kaihar4/mruby-cidr.git'},  # test KO(3) crash(526)
  # {:git => 'https://github.com/hanachin/mruby-cipher.git'}, # need openssl/err.h
  {:git => 'https://github.com/take-cheeze/mruby-clang-plugin.git'},
  # {:git => 'https://github.com/mobiruby/mruby-cocoa.git'},  # need cfunc.h
  ### {:git => 'https://github.com/pbosetti/mruby-complex.git'},  # mruby included
  # {:git => 'https://github.com/christopheraue/m-ruby-concurrently.git'}, # test KO(1) Crash(5)
  {:git => 'https://github.com/matsumotory/mruby-config.git'},
  {:git => 'https://github.com/inokappa/mruby-consul.git', :lib => 'pcre'}, # need forum json
  {:git => 'https://github.com/matsumotory/mruby-correlation.git'},
  # {:git => 'https://github.com/dearblue/mruby-crc.git'},  # build error: can't modify frozen String (FrozenError)
  # {:git => 'https://github.com/matsumotory/mruby-criu.git'},  # need criu/criu.h
  {:git => 'https://github.com/matsumotory/mruby-cross-compile-on-mac-osx.git'},
  {:git => 'https://github.com/mattn/mruby-curl.git'},
  # {:git => 'https://github.com/jbreeden/mruby-curses.git'}, # linker command failed
  # {:git => 'https://github.com/Asmod4n/mruby-czmq.git'},  # need czmq.h
  {:git => 'https://github.com/inokappa/mruby-datadog.git', :lib => 'pcre'},  # need forum json
  {:git => 'https://github.com/dearblue/mruby-delegate.git'},
  {:git => 'https://github.com/iij/mruby-digest.git'},
  {:git => 'https://github.com/iij/mruby-dir.git'},
  # {:git => 'https://github.com/gromnitsky/mruby-dir-glob.git'}, # KO(1)
  {:git => 'https://github.com/matsumotory/mruby-discount.git'},
  # {:git => 'https://github.com/matsumotory/mruby-disque.git'},  # test crash(101)
  # {:git => 'https://github.com/mattn/mruby-dll.git'}, # link error
  # {:git => 'https://github.com/mattn/mruby-eject.git'}, # need linux/cdrom.h
  {:git => 'https://github.com/iij/mruby-env.git'},
  {:git => 'https://github.com/jbreeden/mruby-erb.git'},
  {:git => 'https://github.com/iij/mruby-errno.git'},
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-gpio.git'},  # need driver/gpio.h
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-i2c.git'}, # need driver/i2.h
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-system.git'},  # need esp_system.h
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-wifi.git'},  # need freertos/FreeRTOS.h
  {:git => 'https://github.com/udzura/mruby-etcd.git', :lib => 'pcre'}, # need forum json
  # {:git => 'https://github.com/matsumotory/mruby-eventfd.git'}, # need sys/eventfd.h
  # {:git => 'https://github.com/matsumotory/mruby-fast-remote-check.git'}, # compile error (struct tcphdr)
  {:git => 'https://github.com/mattn/mruby-fiberpool.git'},
  {:git => 'https://github.com/takumakume/mruby-file-access.git'},
  {:git => 'https://github.com/appplant/mruby-file-fnmatch.git'},
  # {:git => 'https://github.com/ksss/mruby-file-stat.git'},  # KO(1)
  # {:git => 'https://github.com/k0u5uk3/mruby-filemagic.git'}, # need magic.h
  # {:git => 'https://github.com/dabroz/mruby-float4.git'}, # Crash(1)
  # {:git => 'https://github.com/mattn/mruby-fltk3.git'}, # No such file of directory - fltk-config
  {:git => 'https://github.com/y-ken/fluent-logger-mruby.git'},
  {:git => 'https://github.com/takahashim/mruby-forwardable.git'},
  {:git => 'https://github.com/UniTN-Mechatronics/mruby-fsm.git'},
  {:git => 'https://github.com/UniTN-Mechatronics/mruby-ftp.git'},
  {:git => 'https://github.com/dearblue/mruby-gemcut.git'},
  # {:git => 'https://github.com/matsumotory/mruby-geoip.git'}, # need GeoIP.h
  {:git => 'https://github.com/takumakume/mruby-getloadavg.git'},
  {:git => 'https://github.com/rubiojr/mruby-getoptlong'},
  {:git => 'https://github.com/mttech/mruby-getopts'},
  {:git => 'https://github.com/Asmod4n/mruby-getpass.git'},
  {:git => 'https://github.com/mame/mruby-gettimeofday.git'},
  # {:git => 'https://github.com/ppibburr/mruby-girffi.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-girffi-docgen.git'},  # need ffi.h
  # {:git => 'https://github.com/xxuejie/mruby-gles.git'},  # need GLES2/gl2.h
  # {:git => 'https://github.com/take-cheeze/mruby-glfw3.git'}, # need GLFW/glfw3.h
  # {:git => 'https://github.com/jbreeden/mruby-glib.git'}, # need glib.h
  # {:git => 'https://github.com/ppibburr/mruby-glib2.git'},  # need ffi.h
  # {:git => 'https://github.com/chasonr/mruby-gmp-bignum.git'},  # need gmp.h
  {:git => 'https://github.com/mattn/mruby-gntp.git'},
  # {:git => 'https://github.com/ppibburr/mruby-gobject.git'},  # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-gobject-introspection.git'},  # need ffi.h
  {:git => 'https://github.com/matsumotory/mruby-growthforecast.git'},
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-gsl.git'},  # need gsl/gsl_vector.h
  # {:git => 'https://github.com/ppibburr/mruby-gtk2.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-gtk3.git'}, # need ffi.h
  {:git => 'https://github.com/k0kubun/mruby-hashie.git'},
  {:git => 'https://github.com/kentaro/mruby-hibari.git', :lib => 'pcre'},
  {:git => 'https://github.com/katzer/mruby-heeler.git'},
  # {:git => 'https://github.com/Asmod4n/mruby-hiredis.git'}, # KO(1) Crash(6)
  # {:git => 'https://github.com/scalone/mruby-hmac.git'},  # test crash(2)
  {:git => 'https://github.com/tk3/mruby-hogun.git'},
  # {:git => 'https://github.com/schmurfy/host-stats.git'}, # need ffi.h
  # {:git => 'https://github.com/masamitsu-murase/mruby-hs-regexp.git'},  # build error (old mruby API)
  {:git => 'https://github.com/mattn/mruby-http.git'},
  # {:git => 'https://github.com/matsumotory/mruby-http2.git'}, # --enable-app --disable-threads --enable-shared=no failed
  {:git => 'https://github.com/matsumotory/mruby-httprequest.git', :lib => 'pcre'}, 
  # {:git => 'https://github.com/Asmod4n/mruby-httpsclient.git'}, # need tls.h
  {:git => 'https://github.com/mattn/mruby-iconv.git'},
  # {:git => 'https://github.com/iij/mruby-iijson.git'},  # Crash(6)
  {:git => 'https://github.com/keizo042/mruby-implerr.git'},
  # {:git => 'https://github.com/FlavourSys/mruby-inotify.git'},  # need sys/inotify.h
  ### {:git => 'https://github.com/iij/mruby-io.git'},  # build error (IIJ -> included)
  {:git => 'https://github.com/ksss/mruby-io-console.git'},
  {:git => 'https://github.com/ksss/mruby-io-copy_stream.git'}, 
  # {:git => 'https://github.com/takumakume/mruby-ionice.git'}, # compile error (SYS_ioprio_get)
  {:git => 'https://github.com/iij/mruby-ipaddr.git'},
  # {:git => 'https://github.com/pepabo/mruby-ipfilter.git'}, # need maxminddb.h
  # {:git => 'https://github.com/rrreeeyyy/mruby-ipvs'},  # implicit declaration of function
  # {:git => 'https://github.com/ppibburr/mruby-javascriptcore.git'}, # build error: uninitialized constant FFI
  # {:git => 'https://github.com/carsonmcdonald/mruby-jpeg.git'}, # need jpeglib.h
  # {:git => 'https://github.com/mattn/mruby-json.git'}, #{:git => 'https://github.com/mruby-Forum/mruby-json.git', :branch => 'support-mruby-2.0.1'}, # origin {:git => 'https://github.com/mattn/mruby-json.git'},
  # {:git => 'https://github.com/jkutner/mruby-jvm.git', :incpath => ["#{JDK_PATH}/include", "#{JDK_PATH}/include/darwin"]}, # test KO(5)
  # {:git => 'https://github.com/prevs-io/mruby-jwt.git'}, # Crash(6)
  # {:git => 'https://github.com/syucream/mruby-k2hash.git'}, # No such file or directory @ dir_chdir
  {:git => 'https://github.com/santazhang/mruby-kmp.git'},
  {:git => 'https://github.com/tsurubee/mruby-knn-detector.git'},
  # {:git => 'https://github.com/crimsonwoods/mruby-leapmotion.git'}, # need Leap.h
  # {:git => 'https://github.com/take-cheeze/mruby-leveldb.git'}, # build error
  {:git => 'https://github.com/Asmod4n/mruby-libhydrogen.git'},
  # {:git => 'https://github.com/cremno/mruby-libqrng.git'},  # link error (libQRNG)
  # {:git => 'https://github.com/Asmod4n/mruby-libsodium.git'}, # build error (libsodium fetch error)
  {:git => 'https://github.com/ksss/mruby-limits.git'},
  {:git => 'https://github.com/Asmod4n/mruby-linenoise.git'},
  # {:git => 'https://github.com/haconiwa/mruby-linux-namespace.git'},  # need error.h
  {:git => 'https://github.com/Asmod4n/mruby-lmdb.git'},
  {:git => 'https://github.com/matsumotory/mruby-localmemcache.git'},
  {:git => 'https://github.com/katzer/mruby-logger.git'},
  {:git => 'https://github.com/matsumotory/mruby-lruc.git'},
  # {:git => 'https://github.com/dyama/mruby-lua.git'}, # need lua5.2/lua.h
  {:git => 'https://github.com/dearblue/mruby-lz4.git'},
  # {:git => 'https://github.com/dearblue/mruby-lzma.git'}, # need lzma.h
  # {:git => 'https://github.com/attm2x/m2x-mruby.git'}, # test abort
  # {:git => 'https://github.com/carsonmcdonald/mruby-markdown.git'}, # Crash(1) 'https://github.com/mruby-Forum/mruby-markdown.git', :branch => 'fix-build'},  #original: 'https://github.com/carsonmcdonald/mruby-markdown.git'
  # {:git => 'https://github.com/take-cheeze/mruby-marshal.git'}, # build error
  # {:git => 'https://github.com/asfluido/mruby-marshal-fast.git'},# unknown warning option
  {:git => 'https://github.com/listrophy/mruby-matrix.git', :dep => ['https://github.com/iij/mruby-mtest.git']}, # test Crash(1)
  # {:git => 'https://github.com/happysiro/mruby-maxminddb'}, # need maxminddb.h
  {:git => 'https://github.com/mattn/mruby-md5.git'},
  # {:git => 'https://github.com/mattn/mruby-mecab.git'}, # need mecab.h
  # {:git => 'https://github.com/matsumotory/mruby-memcached.git'}, # need libmemcached/memcached.h
  # {:git => 'https://github.com/pbosetti/mruby-merb.git'}, # test crash(1) (Regexp)
  # {:git => 'https://github.com/ksss/mruby-method.git'}, # test Crash(6)
  # {:git => 'https://github.com/bggd/mruby-minigame.git'}, # need allogro5/allegro.h
  {:git => 'https://github.com/scalone/mruby-miniz.git'},
  {:git => 'https://github.com/matsumotory/mruby-mod-mruby-ext.git'},
  {:git => 'https://github.com/matsumotory/mruby-mrbgem-template.git'},
  # {:git => 'https://github.com/kjunichi/mruby-mrmagick.git'}, # Magick++-config
  # {:git => 'https://github.com/mattn/mruby-msagent.git'}, # Windows only
  # {:git => 'https://github.com/pepabo/mruby-msd.git'},  # mysql_config
  # {:git => 'https://github.com/suzukaze/mruby-msgpack.git'},  # test crash(11)
  {:git => 'https://github.com/iij/mruby-mtest.git'},
  {:git => 'https://github.com/ksss/mruby-murmurhash1.git'},
  {:git => 'https://github.com/ksss/mruby-murmurhash2.git'},
  {:git => 'https://github.com/matsumotory/mruby-mutex.git'},
  # {:git => 'https://github.com/mattn/mruby-mysql.git'}, # mysql_config
  {:git => 'https://github.com/ppibburr/mruby-named-constants.git'},
  # {:git => 'https://github.com/IceDragon200/mruby-nanovg', :dep => ['https://github.com/IceDragon200/mruby-glew']}, # need GL/glew.h
  # {:git => 'https://github.com/matsumotory/mruby-netlink.git'}, # need asm/types.h
  # {:git => 'https://github.com/pyama86/mruby-network-analyzer.git'}, # build error(sigwaitinfo, mrb_float)
  {:git => 'https://github.com/matsumotory/mruby-ngx-mruby-ext.git'},
  {:git => 'https://github.com/matsumotory/mruby-oauth.git', :lib => 'pcre'},
  # {:git => 'https://github.com/tk3/mruby-odbc.git'},  # need sql.h
  # {:git => 'https://github.com/mattn/mruby-onig-regexp.git'}, # 'build error: https://github.com/mruby-Forum/mruby-onig-regexp.git', :branch => 'support-mruby-latest-version-2.0.1'}, # origin {:git => 'https://github.com/mattn/mruby-onig-regexp.git'},
  {:git => 'https://github.com/k0kubun/mruby-open3.git'},
  {:git => 'https://github.com/fastly/mruby-optparse.git'},
  # {:git => 'https://github.com/hanachin/mruby-opvault.git'},  # need openssl/err.h
  {:git => 'https://github.com/appPlant/mruby-os.git'},
  # {:git => 'https://github.com/ksss/mruby-ostruct.git'}, # test KO(1) Crash(9)
  {:git => 'https://github.com/baldowl/mruby-otp.git'},
  {:git => 'https://github.com/qtkmz/mruby-otpauth.git'},
  # {:git => 'https://github.com/IceDragon200/mruby-oui'}, # need oui.h
  ### {:git => 'https://github.com/iij/mruby-pack.git'},  # IIJ -> included
  {:git => 'https://github.com/Asmod4n/mruby-passwdqc'},
  # {:git => 'https://github.com/mattn/mruby-pcre-regexp.git'}, # test abort
  # {:git => 'https://github.com/dabroz/mruby-perlin-noise.git', :dep => ['https://github.com/iij/mruby-mtest.git']}, # test undefined method 'instance_methods'
  {:git => 'https://github.com/Asmod4n/mruby-phr.git'},
  {:git => 'https://github.com/cadwallion/mruby-pid.git'},
  # {:git => 'https://github.com/schmurfy/mruby-ping', :incpath => '/opt/local/include', :libpath => '/opt/local/lib'}, # build error
  {:git => 'https://github.com/mattn/mruby-pjson.git'},
  {:git => 'https://github.com/hanachin/mruby-pkcs5.git'},
  # {:git => 'https://github.com/pbosetti/mruby-plplot.git'}, # need plConfig.h
  {:git => 'https://github.com/luisbebop/mruby-polarssl.git'},
  {:git => 'https://github.com/Asmod4n/mruby-poll.git'},
  # {:git => 'https://github.com/nsheremet/mruby-pong.git'},  # Test hangup
  # {:git => 'https://github.com/udzura/mruby-posix_ipc.git'},  # need mqueue.h
  # {:git => 'https://github.com/Asmod4n/mruby-postgresql.git'}, # clone error
  {:git => 'https://github.com/Asmod4n/mruby-proc-irep-ext.git'},
  {:git => 'https://github.com/iij/mruby-process.git'},
  {:git => 'https://github.com/appPlant/mruby-process.git'},
  {:git => 'https://github.com/hfm/mruby-publicsuffix.git'},
  # {:git => 'https://github.com/h2so5/mruby-pure-regexp.git'}, # test abort: SEGV?
  {:git => 'https://github.com/mruby-zest/mruby-qml-parse'},
  # {:git => 'https://github.com/mruby-zest/mruby-qml-spawn'},
  # {:git => 'https://github.com/scalone/mruby-qrcode.git'},  # test KO(1)
  {:git => 'https://github.com/katzer/mruby-r3.git', :lib => 'pcre'},
  # {:git => 'https://github.com/ksss/mruby-rake.git'}, # implicit declaration invalid in C99
  # {:git => 'https://github.com/matsumotory/mruby-random.git'},  # build error (random.o)
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-raspberry.git'},  # need wiringPi.h
  ### {:git => 'https://github.com/dyama/mruby-rational.git'},  # mruby inclued
  # {:git => 'https://github.com/matsumotory/mruby-rcon.git'},  # need sys/eventfd.h
  # {:git => 'https://github.com/matsumotory/mruby-redis.git'}, # test crash(97)
  {:git => 'https://github.com/Asmod4n/mruby-redis-ae.git'},
  # {:git => 'https://github.com/yukirii/mruby-redis-cluster.git'}, # test Crash(98)
  {:git => 'https://github.com/iij/mruby-regexp-pcre.git'},
  # {:git => 'https://github.com/takumakume/mruby-renice.git'}, # test KO(1) crash(1)
  # {:git => 'https://github.com/mattn/mruby-require.git'}, # need mruby.h
  # {:git => 'https://github.com/ksss/mruby-research.git'}, # build error: old api?
  # {:git => 'https://github.com/harasou/mruby-resource.git'},  # test crash(3)
  {:git => 'https://github.com/scalone/mruby-ripemd.git'},
  # {:git => 'https://github.com/emsk/mruby-romajify.git'}, # Crash(183)
  # {:git => 'https://github.com/schmurfy/mruby-rubyffi-compat.git'}, # need ffi.h
  # {:git => 'https://github.com/haconiwa/mruby-seccomp.git'},  # need elf.h
  {:git => 'https://github.com/Asmod4n/mruby-secure-compare.git'},
  {:git => 'https://github.com/monochromegane/mruby-secure-random.git'},
  {:git => 'https://github.com/monami-ya-mrb/mruby-serialport.git'},
  # {:git =>'https://github.com/yui-knk/mruby-set.git'}, # Crash(25)
  # {:git => 'https://github.com/katzer/mruby-sftp.git'},# undefined method `rm_rf'
  # {:git => 'https://github.com/appplant/mruby-sftp-glob.git'},# undefined method `rm_rf'
  {:git => 'https://github.com/mattn/mruby-sha1.git'},
  # {:git => 'https://github.com/h2so5/mruby-sha2.git'},  # Crash(3)
  {:git => 'https://github.com/katzer/mruby-shelf.git', :lib => 'pcre'},
  {:git => 'https://github.com/katzer/mruby-shelf-deflater.git'},
  {:git => 'https://github.com/k0kubun/mruby-shellwords.git'},
  # {:git => 'https://github.com/monochromegane/mruby-sidekiq-client.git'}, # Crash(103)
  {:git => 'https://github.com/ksss/mruby-signal.git'},
  # {:git => 'https://github.com/pyama86/mruby-signal-thread.git'}, # compile error (sigwaitinfo)
  # {:git => 'https://github.com/iij/mruby-simple-random.git'}, # Don't know how to rake
  {:git => 'https://github.com/matsumotory/mruby-simplehttp.git', :lib => 'pcre'},
  {:git => 'https://github.com/y-ken/mruby-simplehttp-socket.git'},
  {:git => 'https://github.com/matsumotory/mruby-simplehttpserver.git', :lib => 'pcre'},
  {:git => 'https://github.com/Asmod4n/mruby-simplemsgpack.git'},
  {:git => 'https://github.com/matsumotory/mruby-simpletest.git'},  # 'https://github.com/mruby-Forum/mruby-simpletest.git', :branch => 'fix-mruby-2.1.0-test'}, # original: 
  # {:git => 'https://github.com/mattn/mruby-sinatic.git'}, # test rake aborted (mruby-uv: old API)
  {:git => 'https://github.com/ksss/mruby-singleton.git'},
  {:git => 'https://github.com/ksss/mruby-siphash.git'},
  # {:git => 'https://github.com/matsumotory/mruby-sleep.git'}, # Move to mruby/mrbgems
  # {:git => 'https://github.com/mattn/mruby-json.git'},  # KO(1)
  {:git => 'https://github.com/nsheremet/mruby-smallhttp.git'},
  ### {:git => 'https://github.com/iij/mruby-socket.git'},  # IIJ -> included
  # {:git => 'https://github.com/matsumotory/mruby-spdy.git'},  # build error: openssl/ssl.h not found
  {:git => 'https://github.com/k0kubun/mruby-specinfra.git'},
  {:git => 'https://github.com/jbreeden/mruby-sqlite.git'},
  # {:git => 'https://github.com/mattn/mruby-sqlite3.git'}, # test rake aborded
  # {:git => 'https://github.com/katzer/mruby-ssh.git'}, # undefined method `rm_rf'
  {:git => 'https://github.com/ascaridol/mruby-statemachine.git'},
  {:git => 'https://github.com/mattn/mruby-string-crypt.git'},
  {:git => 'https://github.com/appPlant/mruby-string-ext-latin9.git'},
  {:git => 'https://github.com/Asmod4n/mruby-string-is-utf8.git'},
  {:git => 'https://github.com/hanachin/mruby-string-xor.git'},
  # {:git => 'https://github.com/ksss/mruby-stringio.git'}, # Crash(7)
  # {:git => 'https://github.com/naritta/mruby-strptime.git'},  # implicitly declaring library function
  {:git => 'https://github.com/pyama86/mruby-sysconf.git'},
  {:git => 'https://github.com/iij/mruby-syslog.git'},
  {:git => 'https://github.com/Asmod4n/mruby-sysrandom.git'},
  # {:git => 'https://github.com/nsheremet/mruby-tbot.git'},  # Crash(4)
  {:git => 'https://github.com/iij/mruby-tempfile.git'},
  {:git => 'https://github.com/appPlant/mruby-terminal-table.git'},
  # {:git => 'https://github.com/mattn/mruby-thread.git'}, # test hangup
  {:git => 'https://github.com/monochromegane/mruby-time-strftime.git'},
  # {:git => 'https://github.com/matsumotory/mruby-timer-thread.git'},  # compile error (sigwaitinfo)
=end
  {:git => 'https://github.com/mimaki/mruby-tiny-io.git'},  # Crash(1)
=begin
  {:git => 'https://github.com/katzer/mruby-tiny-opt-parser.git'},
  {:git => 'https://github.com/matsumotory/mruby-tinymt.git'},
  {:git => 'https://github.com/h2so5/mruby-tinyxml2.git'},
  # {:git => 'https://github.com/Asmod4n/mruby-tls.git'}, # need tls.h
  {:git => 'https://github.com/jeremyjung/mruby-tty-screen.git'},
  # {:git => 'https://github.com/take-cheeze/mruby-uchardet.git'},  # compile error (nullptr)
  {:git => 'https://github.com/matsumotory/mruby-uname.git'},
  # {:git => 'https://github.com/keizo042/mruby-unbound.git'},  # need unbound.h
  {:git => 'https://github.com/appPlant/mruby-unicode-display_width.git'},
  {:git => 'https://github.com/mattn/mruby-updategems.git'},
  {:git => 'https://github.com/Asmod4n/mruby-uri-parser.git'},
  {:git => 'https://github.com/matsumotory/mruby-userdata.git'},
  # {:git => 'https://github.com/mattn/mruby-uv.git'},  # build error: MRB_TT_HAS_BASIC
  # {:git => 'https://github.com/mattn/mruby-v8.git'},  # need v8.h
  # {:git => 'https://github.com/matsumotory/mruby-vedis.git'}, # test KO(5)
  # {:git => 'https://github.com/matsumotory/mruby-virtualing.git'},  # need libcgroup.h
  {:git => 'https://github.com/dearblue/mruby-weakref.git'},
  # {:git => 'https://github.com/ppibburr/mruby-webkit-1.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-webkit-3.git'}, # need ffi.h
  # {:git => 'https://github.com/sdottaka/mruby-win32ole.git'}, # Windows only
  {:git => 'https://github.com/mattn/mruby-winapp.git'},
  # {:git => 'https://github.com/akiray03/mruby-WiringPi.git'}, # compile error (linux/spi/spidev.h)
  {:git => 'https://github.com/Asmod4n/mruby-wslay'},
  {:git => 'https://github.com/mrbgems/mruby-yaml.git', :incpath => '/opt/local/include', :libpath => '/opt/local/lib'}, # origin: 'https://github.com/hone/mruby-yaml.git'
  {:git => 'https://github.com/katzer/mruby-yeah.git', :lib => 'pcre'}, 
  {:git => 'https://github.com/matsumotory/mruby-zabbix.git'},
  # {:git => 'https://github.com/mruby-zest/mruby-zest'}, # build error (old API)
  {:git => 'https://github.com/jbreeden/mruby-zlib.git'},
  # {:git => 'https://github.com/zeromq/mruby-zmq.git'},  # autoreconf exited with status 0
  {:git => 'https://github.com/dearblue/mruby-zstd.git'}, 
  # {:git => 'https://github.com/Asmod4n/mruby-zyre.git'},  # need zyre.h
=end
].each {|mgem|
  _git = mgem[:git]
  _branch = mgem[:branch] ? mgem[:branch] : 'master'
  MRuby::Build.new("test-#{_git.split('/')[-1][0..-5]}") do |conf|
    # Gets set by the VS command prompts.
    if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
      toolchain :visualcpp
    else
      toolchain :gcc
    end

    enable_debug
    conf.cc.defines       << mgem[:defines] if mgem[:defines]
    conf.cc.flags         << mgem[:flags]   if mgem[:flags]
    conf.cc.include_paths << mgem[:incpath]     if mgem[:incpath]
    conf.linker.library_paths << mgem[:libpath] if mgem[:libpath]
    conf.linker.libraries << mgem[:lib]         if mgem[:lib]
    conf.enable_bintest
    conf.enable_test

    conf.gembox 'full-core'
    # conf.gembox '../../mruby_build_config/mac'
    if mgem[:dep]
      mgem[:dep].each {|_dep|
        conf.gem :git => _dep
      }
    end
    conf.gem :git => _git, :branch => _branch
  end
}

# MRuby::Build.new('bench') do |conf|
#   # Gets set by the VS command prompts.
#   if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
#     toolchain :visualcpp
#   else
#     toolchain :gcc
#     conf.cc.flags << '-O3'
#   end

#   conf.gembox 'default'
# end

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
