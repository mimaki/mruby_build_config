Encoding.default_external = 'utf-8'

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
  # conf.gembox '../../mruby_build_config/mingw'
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
#   conf.gembox '../../mruby_build_config/mingw'

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
#   conf.gembox '../../mruby_build_config/mingw'
# end

[
=begin
=end
=begin
  # {:git => 'https://github.com/k0u5uk3/mruby-alarm.git'}, # build error (alarm(time))
  # {:git => 'https://github.com/cremno/mruby-allegro.git'}, # need allegro5.h
  {:git => 'https://github.com/ppibburr/mruby-allocate.git'},
  # {:git => 'https://github.com/Mav7/mruby-ansi-colors.git'},  # build error (isdigit())
  # {:git => 'https://github.com/jbreeden/mruby-apr.git'},  # MRB_INT64
  # {:git => 'https://github.com/kyab/mruby-arduino.git'},  # need wProgram.h
  # {:git => 'https://github.com/Asmod4n/mruby-argon2.git'}, # path and function error
  # {:git => 'https://github.com/udzura/mruby-argtable.git'}, # need argtable3.h
  {:git => 'https://github.com/ksss/mruby-at_exit.git'},
  # {:git => 'https://github.com/georgi/mruby-audite.git'}, # need pthread.h
  # {:git => 'https://github.com/hercules-team/mruby-augeas'}  # need augeas.h
  # {:git => 'https://github.com/randym/mruby-avl.git'},
  {:git => 'https://github.com/mruby-Forum/mruby-avl.git', :branch => 'mruby-2.0.0-test'} # original: 'https://github.com/randym/mruby-avl.git'
  # {:git => 'https://github.com/iij/mruby-aws-s3.git'},  # conflicting types for 'spawnve'
  # {:git => 'https://github.com/hfm/mruby-aws-sigv4.git'}, # need sys/wait.h
  {:git => 'https://github.com/Asmod4n/mruby-b64.git'},
  # {:git => 'https://github.com/crimsonwoods/mruby-backtrace.git'},  # build error (need libunwind.h)
  {:git => 'https://github.com/tk3/mruby-base32.git'},
  {:git => 'https://github.com/h2so5/mruby-base58.git'},
  {:git => 'https://github.com/mattn/mruby-base64.git'},
  # {:git => 'https://github.com/baldowl/mruby-bcrypt.git'},  # need sys/errno.h
  # {:git => 'https://github.com/chasonr/mruby-bignum.git'},  # KO(1)
  # {:git => 'https://github.com/kyab/mruby-bin-mirb-hostbased.git'}, # need termios.h
  # {:git => 'https://github.com/bovi/mruby-bin-mruby-afl.git'},  # compile error (__AFL_LOOP)
  # {:git => 'https://github.com/sdottaka/mruby-bin-scite-mruby.git'},  # build error (uintptr_t)
  # {:git => 'https://github.com/IceDragon200/mruby-blendish'}, # need mruby-glew
  # {:git => 'https://github.com/Asmod4n/mruby-c-ext-helpers.git'}, # Ceash(1)
  # {:git => 'https://github.com/charlescui/mruby-cache.git'},  # build error (semaphore.h)
  # {:git => 'https://github.com/matsumotory/mruby-capability.git'},  # need linux/types.h
  # {:git => 'https://github.com/pyama86/mruby-capacity.git'}, # test KO(4)
  # {:git => 'https://github.com/IceDragon200/mruby-catch-throw'}, #test error
  # {:git => 'https://github.com/mobiruby/mruby-cfunc.git'},  # No such file or directory _rubyvm1.c
  # {:git => 'https://github.com/matsumotory/mruby-cgroup.git'},  # need libcgroup.h
  # {:git => 'https://github.com/matsumotory/mruby-changefinder.git'}, # test KO(1) Crach(1)
  # {:git => 'https://github.com/bggd/mruby-channel.git'},  # build error
  # {:git => 'https://github.com/IceDragon200/mruby-chipmunk2d'}, # need chipmunk/chipmunk.h
  {:git => 'https://github.com/Asmod4n/mruby-chrono.git'}, # test error
  # {:git => 'https://github.com/kaihar4/mruby-cidr.git'},  # compile error
  # {:git => 'https://github.com/hanachin/mruby-cipher.git'}, # need openssl/err.h
  {:git => 'https://github.com/take-cheeze/mruby-clang-plugin.git'},
  # {:git => 'https://github.com/mobiruby/mruby-cocoa.git'},  # not support
  ### {:git => 'https://github.com/pbosetti/mruby-complex.git'},  # mruby included
  # {:git => 'https://github.com/christopheraue/m-ruby-concurrently.git'}, #need poll.h
  {:git => 'https://github.com/matsumotory/mruby-config.git'},
  # {:git => 'https://github.com/inokappa/mruby-consul.git'}, # spawnve
  {:git => 'https://github.com/matsumotory/mruby-correlation.git'},
  # {:git => 'https://github.com/dearblue/mruby-crc.git'}, # test error
  # {:git => 'https://github.com/matsumotory/mruby-criu.git'},  # need criu/criu.h
  {:git => 'https://github.com/matsumotory/mruby-cross-compile-on-mac-osx.git'},
  # {:git => 'https://github.com/mattn/mruby-curl.git'},  # need curl/curl.h
  # {:git => 'https://github.com/jbreeden/mruby-curses.git'}, # need curses.h
  # {:git => 'https://github.com/Asmod4n/mruby-czmq.git'},  # need czmq.h
  # {:git => 'https://github.com/inokappa/mruby-datadog.git'},  # need sys/wait.h
  {:git => 'https://github.com/dearblue/mruby-delegate.git'},
  # {:git => 'https://github.com/iij/mruby-digest.git'},  # need openssl/evp.h
  {:git => 'https://github.com/iij/mruby-dir.git'},
  # {:git => 'https://github.com/gromnitsky/mruby-dir-glob.git'}, # need sys/wait.h
  # {:git => 'https://github.com/matsumotory/mruby-discount.git'},  # configure.sh
  # {:git => 'https://github.com/matsumotory/mruby-disque.git'},  # need sys/socket.h
  # {:git => 'https://github.com/mattn/mruby-dll.git'}, # link error (cannot export)
  {:git => 'https://github.com/mattn/mruby-eject.git'},
  {:git => 'https://github.com/iij/mruby-env.git'},
  {:git => 'https://github.com/jbreeden/mruby-erb.git'},
  {:git => 'https://github.com/iij/mruby-errno.git'},
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-gpio.git'},# need driver/gpio.h
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-i2c.git'},# need driver/i2c.h
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-system.git'},# need esp_system.h
  # {:git => 'https://github.com/mruby-esp32/mruby-esp32-wifi.git'},#need freertos/FreeRTOS.h
  # {:git => 'https://github.com/udzura/mruby-etcd.git'}, # argument error(spawnv)
  # {:git => 'https://github.com/matsumotory/mruby-eventfd.git'}, # need sys/wait.h
  # {:git => 'https://github.com/matsumotory/mruby-fast-remote-check.git'}, # need pthread.h
  {:git => 'https://github.com/mattn/mruby-fiberpool.git'},
  # {:git => 'https://github.com/takumakume/mruby-file-access.git'}, #build error
  {:git => 'https://github.com/appplant/mruby-file-fnmatch.git'},
  # {:git => 'https://github.com/ksss/mruby-file-stat.git'},  # KO(1)
  # {:git => 'https://github.com/k0u5uk3/mruby-filemagic.git'}, # need magic.h
  # {:git => 'https://github.com/dabroz/mruby-float4.git'}, # test KO(10)
  # {:git => 'https://github.com/mattn/mruby-fltk3.git'}, # fltk3-config
  {:git => 'https://github.com/y-ken/fluent-logger-mruby.git'},
  # {:git => 'https://github.com/takahashim/mruby-forwardable.git'},  # (undefined reference)
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-fsm.git'},  # POSIX (alerm, pause,useconds_t,initial)
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-ftp.git'},  # build error (getsockname)
  {:git => 'https://github.com/dearblue/mruby-gemcut.git'}, # test error
  # {:git => 'https://github.com/matsumotory/mruby-geoip.git'}, # need GeoIP.h
  # {:git => 'https://github.com/takumakume/mruby-getloadavg.git'}, # link error (getloadavg)
  {:git => 'https://github.com/rubiojr/mruby-getoptlong'},
  {:git => 'https://github.com/mttech/mruby-getopts'},
  # {:git => 'https://github.com/Asmod4n/mruby-getpass.git'}, # need termios.h
  {:git => 'https://github.com/mame/mruby-gettimeofday.git'},
  # {:git => 'https://github.com/ppibburr/mruby-girffi-docgen.git'},  # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-girffi.git'}, # need ffi.h
  # {:git => 'https://github.com/xxuejie/mruby-gles.git'},  # need GLES2/gl2.h
  # {:git => 'https://github.com/take-cheeze/mruby-glfw3.git'}, # need GLES2/gl2.h
  # {:git => 'https://github.com/jbreeden/mruby-glib.git'}, # need glib.h
  # {:git => 'https://github.com/ppibburr/mruby-glib2.git'},  # need ffi.h
  # {:git => 'https://github.com/chasonr/mruby-gmp-bignum.git'},  # need gmp.h
  {:git => 'https://github.com/mattn/mruby-gntp.git'}, # test error
  # {:git => 'https://github.com/ppibburr/mruby-gobject-introspection.git'},  # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-gobject.git'},  # need ffi.h
  {:git => 'https://github.com/matsumotory/mruby-growthforecast.git'}, # test error
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-gsl.git'},  # need gls/gls_blas.h
  # {:git => 'https://github.com/ppibburr/mruby-gtk2.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-gtk3.git'}, # need ffi.h
  {:git => 'https://github.com/k0kubun/mruby-hashie.git'}, # test error
  # {:git => 'https://github.com/kentaro/mruby-hibari.git'},  # need oniguruma.h
  # {:git => 'https://github.com/katzer/mruby-heeler.git'}, # undefined reference asprintf
  # {:git => 'https://github.com/Asmod4n/mruby-hiredis.git'}, # need pthread.h
  # {:git => 'https://github.com/scalone/mruby-hmac.git'}, # test Crash(2)
  {:git => 'https://github.com/tk3/mruby-hogun.git'},
  # {:git => 'https://github.com/schmurfy/host-stats.git'}, # need ffi.h
  # {:git => 'https://github.com/masamitsu-murase/mruby-hs-regexp.git'},  # compile error (ARGS_NONE)
  {:git => 'https://github.com/mattn/mruby-http.git'},
  # {:git => 'https://github.com/matsumotory/mruby-http2.git'}, # autoreconf error
  # {:git => 'https://github.com/matsumotory/mruby-httprequest.git'}, # argument error(spawnv)
  # {:git => 'https://github.com/Asmod4n/mruby-httpsclient.git'}, # need tls.h
  {:git => 'https://github.com/mattn/mruby-iconv.git'},
  # {:git => 'https://github.com/iij/mruby-iijson.git'},  # Crash(6)
  {:git => 'https://github.com/keizo042/mruby-implerr.git'},
  # {:git => 'https://github.com/iij/mruby-io.git'},  #has no member named 'is_socket
  # {:git => 'https://github.com/FlavourSys/mruby-inotify.git'},  # need sys/ionotify.h
  # {:git => 'https://github.com/ksss/mruby-io-console.git'}, # need sys/ioctl.h  
  # {:git => 'https://github.com/ksss/mruby-io-copy_stream.git'}, # need uio.h
  # {:git => 'https://github.com/takumakume/mruby-ionice.git'}, # need sys/wait.h 
  # {:git => 'https://github.com/iij/mruby-ipaddr.git'},  # need sys/socket.h
  # {:git => 'https://github.com/pepabo/mruby-ipfilter.git'}, # Command syntax error
  # {:git => 'https://github.com/rrreeeyyy/mruby-ipvs'}  # implicit declaration of function
  # {:git => 'https://github.com/ppibburr/mruby-javascriptcore.git'}, # const FFI
  # {:git => 'https://github.com/carsonmcdonald/mruby-jpeg.git'}, # need jpeglib.h
  {:git => 'https://github.com/mattn/mruby-json.git'},
  # {:git => 'https://github.com/jkutner/mruby-jvm.git'}, # need jni.h
  # {:git => 'https://github.com/prevs-io/mruby-jwt.git'},  # need openssl/evp.h
  # {:git => 'https://github.com/syucream/mruby-k2hash.git'}, # need k2hash.h
  {:git => 'https://github.com/santazhang/mruby-kmp.git'},
  {:git => 'https://github.com/tsurubee/mruby-knn-detector.git'},
  # {:git => 'https://github.com/crimsonwoods/mruby-leapmotion.git'}, # need Leap.h
  # {:git => 'https://github.com/take-cheeze/mruby-leveldb.git'}, # lebeldb-1.20.0
  # {:git => 'https://github.com/Asmod4n/mruby-libhydrogen.git'},#SystemFunction036@8
  # {:git => 'https://github.com/cremno/mruby-libqrng.git'},  # libQRNG.h
  # {:git => 'https://github.com/Asmod4n/mruby-libsodium.git'}, # build error (.)
  # {:git => 'https://github.com/ksss/mruby-limits.git'}, # test KO(1)
  # {:git => 'https://github.com/Asmod4n/mruby-linenoise.git'}, #'EWOULDBLOCK' undeclared
  # {:git => 'https://github.com/haconiwa/mruby-linux-namespace.git'},  # implicit declaration of function
  # {:git => 'https://github.com/Asmod4n/mruby-lmdb.git'},  # compile error
  # {:git => 'https://github.com/matsumotory/mruby-localmemcache.git'}, # need semaphore.h
  {:git => 'https://github.com/katzer/mruby-logger.git'}, 
  # {:git => 'https://github.com/matsumotory/mruby-lruc.git'},  # need pthread.h
  # {:git => 'https://github.com/dyama/mruby-lua.git'}, # need lua5/lua.h
  {:git => 'https://github.com/dearblue/mruby-lz4.git'},
  # {:git => 'https://github.com/dearblue/mruby-lzma.git'},# need izma.h
  # {:git => 'https://github.com/attm2x/m2x-mruby.git'}, # test error
  # {:git => 'https://github.com/carsonmcdonald/mruby-markdown.git'}, # compile error (ARGS_NONE)
  # {:git => 'https://github.com/take-cheeze/mruby-marshal.git'}, # compile error (onig_~)
  # {:git => 'https://github.com/asfluido/mruby-marshal-fast.git'}, # implicit declaration of function 'bzero'
  # {:git => 'https://github.com/mimaki/mruby-matrix.git', :branch => 'fix_test'},  # test Crash(1), original: 'https://github.com/listrophy/mruby-matrix.git'
  # {:git => 'https://github.com/happysiro/mruby-maxminddb'}, # command faild
  {:git => 'https://github.com/mattn/mruby-md5.git'},
  # {:git => 'https://github.com/mattn/mruby-mecab.git'}, # need mecab.h
  # {:git => 'https://github.com/matsumotory/mruby-memcached.git'}, # need libmemchached/memcached.h
  # {:git => 'https://github.com/pbosetti/mruby-merb.git'}, # test crush(1)
  # {:git => 'https://github.com/ksss/mruby-method.git'}, # test Crash(5)
  # {:git => 'https://github.com/bggd/mruby-minigame.git'}, # need allegro5/allegro.h
  {:git => 'https://github.com/scalone/mruby-miniz.git'},
  {:git => 'https://github.com/matsumotory/mruby-mod-mruby-ext.git'},
  {:git => 'https://github.com/matsumotory/mruby-mrbgem-template.git'},   # build error
  # {:git => 'https://github.com/kjunichi/mruby-mrmagick.git'}, # undefined method include?
  # {:git => 'https://github.com/mattn/mruby-msagent.git'}, # compile error (ARGS_OPT(x))
  # {:git => 'https://github.com/pepabo/mruby-msd.git'},  # No such file or directory - mysql_config --cflags
  # {:git => 'https://github.com/suzukaze/mruby-msgpack.git'},  # test crush(11)
  {:git => 'https://github.com/iij/mruby-mtest.git'}, 
  {:git => 'https://github.com/ksss/mruby-murmurhash1.git'},
  {:git => 'https://github.com/ksss/mruby-murmurhash2.git'},
  # {:git => 'https://github.com/matsumotory/mruby-mutex.git'}, # need sys/shm.h
  # {:git => 'https://github.com/mattn/mruby-mysql.git'}, # No such file or directory - mysql_config --cflags
  {:git => 'https://github.com/ppibburr/mruby-named-constants.git'}, 
  # {:git => 'https://github.com/IceDragon200/mruby-nanovg'} # need mruby-glew
  # {:git => 'https://github.com/matsumotory/mruby-netlink.git'}, # need net/if.h
  # {:git => 'https://github.com/pyama86/mruby-network-analyzer.git'}, # sys/wait.h
  {:git => 'https://github.com/matsumotory/mruby-ngx-mruby-ext.git'},
  # {:git => 'https://github.com/matsumotory/mruby-oauth.git'}, #  too many arguments to function 'spawnv'
  # {:git => 'https://github.com/tk3/mruby-odbc.git'},  # compile error
  # {:git => 'https://github.com/mattn/mruby-onig-regexp.git'}, # link error (onig_~)
  # {:git => 'https://github.com/k0kubun/mruby-open3.git'}, # sys/wait.h
  # {:git => 'https://github.com/fastly/mruby-optparse.git'}, # link error (onig_~)
  # {:git => 'https://github.com/hanachin/mruby-opvault.git'},  # need openssl/err.h
  {:git => 'https://github.com/appPlant/mruby-os.git'},
  # {:git => 'https://github.com/ksss/mruby-ostruct.git'}, # test KO(1) Crash(9) 
  # {:git => 'https://github.com/baldowl/mruby-otp.git'},# need openssl/evp.h
  # {:git => 'https://github.com/qtkmz/mruby-otpauth.git'}, # need openssl/evp.h
  # {:git => 'https://github.com/IceDragon200/mruby-oui'}  # need oui.h
  # {:git => 'https://github.com/Asmod4n/mruby-passwdqc'},  # need pwd.h
  # {:git => 'https://github.com/mattn/mruby-pcre-regexp.git'}, # need pcre.h
  # {:git => 'https://github.com/dabroz/mruby-perlin-noise.git'},#test aborted
  {:git => 'https://github.com/Asmod4n/mruby-phr.git'},
  {:git => 'https://github.com/cadwallion/mruby-pid.git'},
  # {:git => 'https://github.com/schmurfy/mruby-ping'} # need netdb.h
  {:git => 'https://github.com/mattn/mruby-pjson.git'},
  # {:git => 'https://github.com/hanachin/mruby-pkcs5.git'},  # need openssl/evp.h
  # {:git => 'https://github.com/pbosetti/mruby-plplot.git'},  # need plConfig.h
  # {:git => 'https://github.com/luisbebop/mruby-polarssl.git'}, # implicit declaration of function
  # {:git => 'https://github.com/Asmod4n/mruby-poll.git'},  # need poll.h
  # {:git => 'https://github.com/nsheremet/mruby-pong.git'}, #need pthread.h
  # {:git => 'https://github.com/udzura/mruby-posix_ipc.git'},  # need sys/wait.h
  # {:git => 'https://github.com/Asmod4n/mruby-postgresql.git'},# compile error (command fault)
  {:git => 'https://github.com/Asmod4n/mruby-proc-irep-ext.git'},
  # {:git => 'https://github.com/iij/mruby-process.git'}, # need sys/wait.h
  # {:git => 'https://github.com/appPlant/mruby-process.git'},# too many arguments to function 'spawnv'
  # {:git => 'https://github.com/hfm/mruby-publicsuffix.git'}, # link error (onig_~)
  {:git => 'https://github.com/h2so5/mruby-pure-regexp.git'},
  {:git => 'https://github.com/mruby-zest/mruby-qml-parse'},
  # {:git => 'https://github.com/mruby-zest/mruby-qml-spawn'}, # Crash(25)
  # {:git => 'https://github.com/scalone/mruby-qrcode.git'}, # error qrGetCurrentFunctionName
  # {:git => 'https://github.com/katzer/mruby-r3.git'}, # undefined reference to `asprintf'
  # {:git => 'https://github.com/ksss/mruby-rake.git'}, # implicit declaration of function
  # {:git => 'https://github.com/matsumotory/mruby-random.git'},  # build error (random.c)
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-raspberry.git'},  # need wiringPi.h
  ### {:git => 'https://github.com/dyama/mruby-rational.git'},  # mruby included
  # {:git => 'https://github.com/matsumotory/mruby-rcon.git'},  # need pthread.h
  # {:git => 'https://github.com/matsumotory/mruby-redis.git'}, # need sys/socket.h
  # {:git => 'https://github.com/Asmod4n/mruby-redis-ae.git'},  # need pthread.h
  # {:git => 'https://github.com/yukirii/mruby-redis-cluster.git'}, # need sys/soket.h
  {:git => 'https://github.com/iij/mruby-regexp-pcre.git'},
  # {:git => 'https://github.com/takumakume/mruby-renice.git'},#need pwd.h
  # {:git => 'https://github.com/mattn/mruby-require.git'}, # implicit declaration of function
  # {:git => 'https://github.com/ksss/mruby-research.git'}, # build error
  # {:git => 'https://github.com/harasou/mruby-resource.git'}, # implicit declaration of function
  {:git => 'https://github.com/scalone/mruby-ripemd.git'},
  # {:git => 'https://github.com/emsk/mruby-romajify.git'}, # link error (onig_xxxx)
  # {:git => 'https://github.com/schmurfy/mruby-rubyffi-compat.git'}, # need ffi.h
  # {:git => 'https://github.com/haconiwa/mruby-seccomp.git'},  # build error (mkdir)
  {:git => 'https://github.com/Asmod4n/mruby-secure-compare.git'},
  {:git => 'https://github.com/monochromegane/mruby-secure-random.git'},
  # {:git => 'https://github.com/monami-ya-mrb/mruby-serialport.git'},  # need termios.h
  # {:git => 'https://github.com/yui-knk/mruby-set.git'}, # Crash(25)
  # {:git => 'https://github.com/katzer/mruby-sftp.git'}, # command error rm_rf
  # {:git => 'https://github.com/appplant/mruby-sftp-glob.git'},# command error rm_rf
  {:git => 'https://github.com/mattn/mruby-sha1.git'},
  # {:git => 'https://github.com/h2so5/mruby-sha2.git'},  # Crash(3)
  # {:git => 'https://github.com/katzer/mruby-shelf.git'},  # undefined reference to `asprintf'
  # {:git => 'https://github.com/katzer/mruby-shelf-deflater.git'}, # need zlib.h
  # {:git => 'https://github.com/k0kubun/mruby-shellwords.git'},  # link error (oniguma)
  # {:git => 'https://github.com/monochromegane/mruby-sidekiq-client.git'}, # need sys/socket.h
  # {:git => 'https://github.com/ksss/mruby-signal.git'}, # KO(1) Crash(2)
  # {:git => 'https://github.com/pyama86/mruby-signal-thread.git'}, # need sys/wait.h
  # {:git => 'https://github.com/iij/mruby-simple-random.git'}, # Don't know how to rake
  # {:git => 'https://github.com/matsumotory/mruby-simplehttp.git'},  # too many arguments to function 'spawnv'
  {:git => 'https://github.com/y-ken/mruby-simplehttp-socket.git'},
  # {:git => 'https://github.com/matsumotory/mruby-simplehttpserver.git'}, # too many arguments to function 'spawnv'
  {:git => 'https://github.com/Asmod4n/mruby-simplemsgpack.git'},
  {:git => 'https://github.com/matsumotory/mruby-simpletest.git'},
  # {:git => 'https://github.com/mattn/mruby-sinatic.git'}, # need uv.h
  {:git => 'https://github.com/ksss/mruby-singleton.git'},
  {:git => 'https://github.com/ksss/mruby-siphash.git'},
  ### {:git => 'https://github.com/matsumotory/mruby-sleep.git'}, # mruby included
  # {:git => 'https://github.com/nsheremet/mruby-smallhttp.git'},#implicit declaration of function 
  # {:git => 'https://github.com/iij/mruby-socket.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-spdy.git'},  # autoreconf command not found
  # {:git => 'https://github.com/k0kubun/mruby-specinfra.git'}, # link erorr (onigumo)
  {:git => 'https://github.com/jbreeden/mruby-sqlite.git'},
  # {:git => 'https://github.com/mattn/mruby-sqlite3.git'}, # need sqlite3.h
  # {:git => 'https://github.com/katzer/mruby-ssh.git'}, # undefined method `rm_rf'
  {:git => 'https://github.com/ascaridol/mruby-statemachine.git'},
  # {:git => 'https://github.com/mattn/mruby-string-crypt.git'},  # need pthread.h
  {:git => 'https://github.com/appPlant/mruby-string-ext-latin9.git'},
  {:git => 'https://github.com/Asmod4n/mruby-string-is-utf8.git'},
  # {:git => 'https://github.com/hanachin/mruby-string-xor.git'}, # test abort
  # {:git => 'https://github.com/ksss/mruby-stringio.git'}, # Crash(7)
  # {:git => 'https://github.com/naritta/mruby-strptime.git'},#build error(onig)
  # {:git => 'https://github.com/pyama86/mruby-sysconf.git'}, # Crash(1)
  # {:git => 'https://github.com/iij/mruby-syslog.git'},  # need syslog.h
  # {:git => 'https://github.com/Asmod4n/mruby-sysrandom.git'}, # build error (SystemFunction036@8)
  # {:git => 'https://github.com/nsheremet/mruby-tbot.git'},  # implicit declaration of function 'gmtime_s'
  # {:git => 'https://github.com/iij/mruby-tempfile.git'},  # fts.h
  # {:git => 'https://github.com/appPlant/mruby-terminal-table.git'}, # KO(4)
  # {:git => 'https://github.com/mattn/mruby-thread.git'},  # need pthread.h
  {:git => 'https://github.com/monochromegane/mruby-time-strftime.git'},  
  # {:git => 'https://github.com/matsumotory/mruby-timer-thread.git'},  # need pthread.h
  # {:git => 'https://github.com/mimaki/mruby-tiny-io.git'},  # KO(3) Ceash(1)
  {:git => 'https://github.com/katzer/mruby-tiny-opt-parser.git'},
  {:git => 'https://github.com/matsumotory/mruby-tinymt.git'},
  {:git => 'https://github.com/h2so5/mruby-tinyxml2.git'},
  # {:git => 'https://github.com/Asmod4n/mruby-tls.git'}, # need tls.h
  # {:git => 'https://github.com/jeremyjung/mruby-tty-screen.git'}, # too many arguments to function
  {:git => 'https://github.com/take-cheeze/mruby-uchardet.git'},  
  # {:git => 'https://github.com/matsumotory/mruby-uname.git'}, # need sys/utsname.h
  # {:git => 'https://github.com/keizo042/mruby-unbound.git'},  # need unbound.h
  # {:git => 'https://github.com/appPlant/mruby-unicode-display_width.git'},  # KO(3)
  {:git => 'https://github.com/mattn/mruby-updategems.git'},
  {:git => 'https://github.com/Asmod4n/mruby-uri-parser.git'},
  {:git => 'https://github.com/matsumotory/mruby-userdata.git'},
  # {:git => 'https://github.com/mattn/mruby-uv.git'},  # need uv.h
  # {:git => 'https://github.com/mattn/mruby-v8.git'},  # need v8.h
  # {:git => 'https://github.com/matsumotory/mruby-vedis.git'}, # test aborted
  # {:git => 'https://github.com/matsumotory/mruby-virtualing.git'},  # need sys/wait.h
  {:git => 'https://github.com/dearblue/mruby-weakref.git'},
  # {:git => 'https://github.com/ppibburr/mruby-webkit-1.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-webkit-3.git'}, # need ffi.h
  # {:git => 'https://github.com/sdottaka/mruby-win32ole.git'},  # test abort
  {:git => 'https://github.com/mattn/mruby-winapp.git'},
  # {:git => 'https://github.com/akiray03/mruby-WiringPi.git'}, # need termios.h
  # {:git => 'https://github.com/Asmod4n/mruby-wslay'} # build error
  # {:git => 'https://github.com/mrbgems/mruby-yaml.git'}, # curl command error
  # {:git => 'https://github.com/katzer/mruby-yeah.git'}, # build error(r3_tree_~)
  {:git => 'https://github.com/matsumotory/mruby-zabbix.git'},
  # {:git => 'https://github.com/mruby-zest/mruby-zest'}, # implicit declaration of function mrb_ary_len
  # {:git => 'https://github.com/jbreeden/mruby-zlib.git'}, # need zlib.h
  # {:git => 'https://github.com/zeromq/mruby-zmq.git'},  # cannot find libzmq, building it
  # {:git => 'https://github.com/dearblue/mruby-zstd.git'}, # Crash(2)
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
    conf.defines          << mgem[:defines] if mgem[:defines]
    conf.cc.flags         << mgem[:flags]   if mgem[:flags]
    conf.cc.include_paths << mgem[:inc]     if mgem[:inc]
    conf.linker.library_paths << mgem[:lib] if mgem[:lib]
    conf.enable_bintest
    conf.enable_test

    conf.gembox 'full-core'
    # conf.gembox '../../mruby_build_config/mingw'
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
