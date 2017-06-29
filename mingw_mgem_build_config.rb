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
  # {:git => 'https://github.com/k0u5uk3/mruby-alarm.git'}, # build error (alarm(time))
  # {:git => 'https://github.com/cremno/mruby-allegro.git'}, # need allegro5.h
  # {:git => 'https://github.com/ppibburr/mruby-allocate.git'}, # build error
  # {:git => 'https://github.com/Mav7/mruby-ansi-colors.git'},  # build error (is_digit())
  # {:git => 'https://github.com/jbreeden/mruby-apr.git'},  # MRB_INT64
  # {:git => 'https://github.com/kyab/mruby-arduino.git'},  # need wProgram.h
  # {:git => 'https://github.com/udzura/mruby-argtable.git'}, # need argtable2.h
  {:git => 'https://github.com/ksss/mruby-at_exit.git'},
  # {:git => 'https://github.com/georgi/mruby-audite.git'}, # need mpg12.h
  # {:git => 'https://github.com/hercules-team/mruby-augeas'  # need augeas.h
  # {:git => 'https://github.com/randym/mruby-avl.git'},  # test NG(1) crush
  # {:git => 'https://github.com/iij/mruby-aws-s3.git'},  # need openssl/evp.h
  {:git => 'https://github.com/Asmod4n/mruby-b64.git'},
  # {:git => 'https://github.com/crimsonwoods/mruby-backtrace.git'},  # build error (need libunwind.h)
  {:git => 'https://github.com/qtkmz/mruby-base32.git'},
  {:git => 'https://github.com/h2so5/mruby-base58.git'},
  {:git => 'https://github.com/mattn/mruby-base64.git'},
  # {:git => 'https://github.com/baldowl/mruby-bcrypt.git'},  # need openssl/rand.h
  {:git => 'https://github.com/chasonr/mruby-bignum.git'},
  # {:git => 'https://github.com/kyab/mruby-bin-mirb-hostbased.git'}, # need termios.h
  # {:git => 'https://github.com/bovi/mruby-bin-mruby-afl.git'},  # compile error (__AFL_LOOP)
  # {:git => 'https://github.com/sdottaka/mruby-bin-scite-mruby.git'},  # build error (uintptr_t)
  # {:git => 'https://github.com/IceDragon200/mruby-blendish' # need mruby-glew
  # {:git => 'https://github.com/charlescui/mruby-cache.git'},  # build error (semaphore.h)
  # {:git => 'https://github.com/matsumotory/mruby-capability.git'},  # need linux/types.h
  {:git => 'https://github.com/IceDragon200/mruby-catch-throw'},
  # {:git => 'https://github.com/mobiruby/mruby-cfunc.git'},  # need ffi.h
  # {:git => 'https://github.com/matsumotory/mruby-cgroup.git'},  # need libcgroup.h
  # {:git => 'https://github.com/matsumotory/mruby-changefinder.git'},  # unknown mkdtemp/mkstemp
  # {:git => 'https://github.com/bggd/mruby-channel.git'},  # build error
  # {:git => 'https://github.com/IceDragon200/mruby-chipmunk2d' # need chipmunk/chipmunk.h
  {:git => 'https://github.com/Asmod4n/mruby-chrono.git'},
  # {:git => 'https://github.com/kaihar4/mruby-cidr.git'},  # need oniguruma.h
  # {:git => 'https://github.com/hanachin/mruby-cipher.git'}, # need openssl/err.h
  # {:git => 'https://github.com/take-cheeze/mruby-clang-plugin.git'},  # build error (llvm-config)
  # {:git => 'https://github.com/mobiruby/mruby-cocoa.git'},  # not support
  {:git => 'https://github.com/pbosetti/mruby-complex.git'},
  {:git => 'https://github.com/matsumotory/mruby-config.git'},
  # {:git => 'https://github.com/inokappa/mruby-consul.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-correlation.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-criu.git'},  # need criu/criu.h
  {:git => 'https://github.com/matsumotory/mruby-cross-compile-on-mac-osx.git'},
  # {:git => 'https://github.com/mattn/mruby-curl.git'},  # need curl/curl.h
  # {:git => 'https://github.com/jbreeden/mruby-curses.git'}, # need curses.h
  # {:git => 'https://github.com/Asmod4n/mruby-czmq.git'},  # need czmq.h
  # {:git => 'https://github.com/inokappa/mruby-datadog.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/iij/mruby-digest.git'},  # need openssl/evp.h
  # {:git => 'https://github.com/gromnitsky/mruby-dir-glob.git'}, # need sys/wait.h
  {:git => 'https://github.com/iij/mruby-dir.git'},
  # {:git => 'https://github.com/matsumotory/mruby-discount.git'},  # configure.sh
  # {:git => 'https://github.com/matsumotory/mruby-disque.git'},  # need sys/socket.h
  # {:git => 'https://github.com/mattn/mruby-dll.git'}, # link error (cannot export)
  {:git => 'https://github.com/mattn/mruby-eject.git'},
  {:git => 'https://github.com/iij/mruby-env.git'},
  {:git => 'https://github.com/jbreeden/mruby-erb.git'},
  {:git => 'https://github.com/iij/mruby-errno.git'},
  # {:git => 'https://github.com/udzura/mruby-etcd.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-eventfd.git'}, # need sys/eventfd.h
  # {:git => 'https://github.com/matsumotory/mruby-fast-remote-check.git'}, # need sys/socket.h
  {:git => 'https://github.com/ksss/mruby-file-stat.git'},
  # {:git => 'https://github.com/k0u5uk3/mruby-filemagic.git'}, # need magic.h
  {:git => 'https://github.com/dabroz/mruby-float4.git'},
  # {:git => 'https://github.com/mattn/mruby-fltk3.git'}, # fltk3-config
  {:git => 'https://github.com/y-ken/fluent-logger-mruby.git'},
  # {:git => 'https://github.com/takahashim/mruby-forwardable.git'},  # need oniguruma.h
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-fsm.git'},  # POSIX (alerm, pause)
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-ftp.git'},  # build error (GRAB_STDOUT, C90)
  # {:git => 'https://github.com/matsumotory/mruby-geoip.git'}, # need GeoIP.h
=end
  {:git => 'https://github.com/takumakume/mruby-getloadavg.git'},
=begin
  {:git => 'https://github.com/rubiojr/mruby-getoptlong'},
  {:git => 'https://github.com/mttech/mruby-getopts'},
  # {:git => 'https://github.com/Asmod4n/mruby-getpass.git'}, # need termios.h
  # {:git => 'https://github.com/ppibburr/mruby-girffi-docgen.git'},  # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-girffi.git'}, # need ffi.h
  # {:git => 'https://github.com/xxuejie/mruby-gles.git'},  # need GLES2/gl2.h
  # {:git => 'https://github.com/take-cheeze/mruby-glfw3.git'}, # need GLFW/glfw3.h
  # {:git => 'https://github.com/jbreeden/mruby-glib.git'}, # need glib.h
  # {:git => 'https://github.com/ppibburr/mruby-glib2.git'},  # need ffi.h
  # {:git => 'https://github.com/chasonr/mruby-gmp-bignum.git'},  # need gmp.h
  {:git => 'https://github.com/mattn/mruby-gntp.git'},
  # {:git => 'https://github.com/ppibburr/mruby-gobject-introspection.git'},  # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-gobject.git'},  # need ffi.h
  {:git => 'https://github.com/matsumotory/mruby-growthforecast.git'},
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-gsl.git'},  # need gls/gls_vector.h
  # {:git => 'https://github.com/ppibburr/mruby-gtk2.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-gtk3.git'}, # need ffi.h
  {:git => 'https://github.com/k0kubun/mruby-hashie.git'},
  # {:git => 'https://github.com/kentaro/mruby-hibari.git'},  # need oniguruma.h
  # {:git => 'https://github.com/Asmod4n/mruby-hiredis.git'}, # compile error (EINPROGRESS)
  {:git => 'https://github.com/qtkmz/mruby-hogun.git'},
  # {:git => 'https://github.com/schmurfy/host-stats.git'}, # need ffi.h
  # {:git => 'https://github.com/masamitsu-murase/mruby-hs-regexp.git'},  # compile error (ARGS_NONE)
  {:git => 'https://github.com/mattn/mruby-http.git'},
  # {:git => 'https://github.com/matsumotory/mruby-http2.git'}, # autoreconf error
  # {:git => 'https://github.com/matsumotory/mruby-httprequest.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/Asmod4n/mruby-httpsclient.git'}, # need tls.h
  {:git => 'https://github.com/mattn/mruby-iconv.git'},
  {:git => 'https://github.com/iij/mruby-iijson.git'},
  # {:git => 'https://github.com/FlavourSys/mruby-inotify.git'},  # need sys/ionotify.h
  # {:git => 'https://github.com/ksss/mruby-io-console.git'}, # need sys/ioctl.h
  # {:git => 'https://github.com/ksss/mruby-io-copy_stream.git'}, # need uio.h
  # {:git => 'https://github.com/iij/mruby-io.git'},  # mkdtemp/mkstemp
=end
  {:git => 'https://github.com/takumakume/mruby-ionice.git'},
=begin
  # {:git => 'https://github.com/iij/mruby-ipaddr.git'},  # need sys/socket.h
  # {:git => 'https://github.com/pepabo/mruby-ipfilter.git'}, # need sys/shm.h
  # {:git => 'https://github.com/rrreeeyyy/mruby-ipvs'  # need sys/wait.h
  # {:git => 'https://github.com/ppibburr/mruby-javascriptcore.git'}, # const FFI
  # {:git => 'https://github.com/carsonmcdonald/mruby-jpeg.git'}, # need jpeglib.h
  # {:git => 'https://github.com/mattn/mruby-json.git'},  # test crush(2)
  # {:git => 'https://github.com/jkutner/mruby-jvm.git'}, # need jni.h
  # {:git => 'https://github.com/prevs-io/mruby-jwt.git'},  # need openssl/evp.h
  # {:git => 'https://github.com/syucream/mruby-k2hash.git'}, # need k2hash.h
  {:git => 'https://github.com/santazhang/mruby-kmp.git'},
  # {:git => 'https://github.com/crimsonwoods/mruby-leapmotion.git'}, # need Leap.h
  # {:git => 'https://github.com/take-cheeze/mruby-leveldb.git'}, # lebeldb-1.15.0
  # {:git => 'https://github.com/cremno/mruby-libqrng.git'},  # libQRNG
  # {:git => 'https://github.com/Asmod4n/mruby-libsodium.git'}, # build error (.)
  {:git => 'https://github.com/ksss/mruby-limits.git'},
  # {:git => 'https://github.com/Asmod4n/mruby-linenoise.git'}, # need termios.h
  # {:git => 'https://github.com/haconiwa/mruby-linux-namespace.git'},  # need sys/mount.h
  # {:git => 'https://github.com/Asmod4n/mruby-lmdb.git'},  # compile error (MDB_XXX)
  # {:git => 'https://github.com/matsumotory/mruby-localmemcache.git'}, # compile error (semaphore)
  # {:git => 'https://github.com/katzer/mruby-logger.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-lruc.git'},  # need err.h
  # {:git => 'https://github.com/dyama/mruby-lua.git'}, # need lua5/lua.h
  # {:git => 'https://github.com/attm2x/m2x-mruby.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/carsonmcdonald/mruby-markdown.git'}, # compile error (ARGS_NONE)
  # {:git => 'https://github.com/take-cheeze/mruby-marshal.git'}, # need oniguruma.h
  # {:git => 'https://github.com/mimaki/mruby-matrix.git', 'fix_test'},  # test KO(3) crush(2), original: 'https://github.com/listrophy/mruby-matrix.git'
  # {:git => 'https://github.com/happysiro/mruby-maxminddb' # need maxminddb.h
  {:git => 'https://github.com/mattn/mruby-md5.git'},
  # {:git => 'https://github.com/mattn/mruby-mecab.git'}, # need mecab.h
  # {:git => 'https://github.com/matsumotory/mruby-memcached.git'}, # need libmemchached/memcached.h
  # {:git => 'https://github.com/pbosetti/mruby-merb.git'}, # test crush(1)
  # {:git => 'https://github.com/ksss/mruby-method.git'}, # need alloca.h
  # {:git => 'https://github.com/bggd/mruby-minigame.git'}, # need allegro5/allegro.h
  {:git => 'https://github.com/matsumotory/mruby-mod-mruby-ext.git'},
  # {:git => 'https://github.com/matsumotory/mruby-mrbgem-template.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/kjunichi/mruby-mrmagick.git'}, # CORE_RL_magicj.dll
  # {:git => 'https://github.com/mattn/mruby-msagent.git'}, # compile error (ARGS_OPT(x))
  # {:git => 'https://github.com/pepabo/mruby-msd.git'},  # need sys/socket.h
  # {:git => 'https://github.com/suzukaze/mruby-msgpack.git'},  # test crush(11)
  # {:git => 'https://github.com/iij/mruby-mtest.git'}, # mkdtemp/mkstemp
  {:git => 'https://github.com/ksss/mruby-murmurhash1.git'},
  {:git => 'https://github.com/ksss/mruby-murmurhash2.git'},
  # {:git => 'https://github.com/matsumotory/mruby-mutex.git'}, # need sys/shm.h
  # {:git => 'https://github.com/mattn/mruby-mysql.git'}, # mysql_config
  # {:git => 'https://github.com/ppibburr/mruby-named-constants.git'},  # need cfunc.h
  # {:git => 'https://github.com/IceDragon200/mruby-nanovg' # need mgem-glew
  # {:git => 'https://github.com/matsumotory/mruby-netlink.git'}, # need net/if.h
  {:git => 'https://github.com/matsumotory/mruby-ngx-mruby-ext.git'},
  # {:git => 'https://github.com/matsumotory/mruby-oauth.git'}, # need openssl/evp.h
  # {:git => 'https://github.com/qtkmz/mruby-odbc.git'},  # compile error (sqlite)
  # {:git => 'https://github.com/mattn/mruby-onig-regexp.git'}, # link error (???)
  # {:git => 'https://github.com/k0kubun/mruby-open3.git'}, # compile error (execvp)
  # {:git => 'https://github.com/fastly/mruby-optparse.git'}, # need oniguruma.h
  # {:git => 'https://github.com/hanachin/mruby-opvault.git'},  # need openssl/err.h
  {:git => 'https://github.com/appPlant/mruby-os.git'},
  # {:git => 'https://github.com/ksss/mruby-ostruct.git'},  # test crush(4)
  # {:git => 'https://github.com/qtkmz/mruby-otpauth.git'}, # need openssl/evp.h
  # {:git => 'https://github.com/IceDragon200/mruby-oui'  # need oui.h
  {:git => 'https://github.com/iij/mruby-pack.git'},
  # {:git => 'https://github.com/Asmod4n/mruby-passwdqc'  # need pwd.h
  # {:git => 'https://github.com/mattn/mruby-pcre-regexp.git'}, # need pcre.h
  {:git => 'https://github.com/dabroz/mruby-perlin-noise.git'},
  {:git => 'https://github.com/Asmod4n/mruby-phr.git'},
  {:git => 'https://github.com/cadwallion/mruby-pid.git'},
  # {:git => 'https://github.com/schmurfy/mruby-ping' # need netdb.h
  {:git => 'https://github.com/mattn/mruby-pjson.git'},
  # {:git => 'https://github.com/hanachin/mruby-pkcs5.git'},  # need openssl/evp.h
  # {:git => 'https://github.com/pbosetti/mruby-plplot.git'},  # need plConfig.h
  # {:git => 'https://github.com/luisbebop/mruby-polarssl.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/Asmod4n/mruby-poll.git'},  # need poll.h
  # {:git => 'https://github.com/udzura/mruby-posix_ipc.git'},  # need mqueue.h
  # {:git => 'https://github.com/iij/mruby-process.git'}, # need sys/wait.h
  {:git => 'https://github.com/h2so5/mruby-pure-regexp.git'},
  # {:git => 'https://github.com/katzer/mruby-r3.git'}, # mkstemp
  # {:git => 'https://github.com/ksss/mruby-rake.git'}, # need sys/wait.h
  # {:git => 'https://github.com/matsumotory/mruby-random.git'},  # build error (random.c)
  # {:git => 'https://github.com/UniTN-Mechatronics/mruby-raspberry.git'},  # need wiringPi.h
  {:git => 'https://github.com/mimaki/mruby-rational.git', :branch => 'fix_test'},  # original: https://github.com/dyama/mruby-rational.git
  # {:git => 'https://github.com/matsumotory/mruby-rcon.git'},  # need sys/eventfd.h
  # {:git => 'https://github.com/Asmod4n/mruby-redis-ae.git'},  # need poll.h
  # {:git => 'https://github.com/matsumotory/mruby-redis.git'}, # need sys/socket.h
  {:git => 'https://github.com/iij/mruby-regexp-pcre.git'},
  # {:git => 'https://github.com/mattn/mruby-require.git'}, # build error (mrbc)
  # {:git => 'https://github.com/ksss/mruby-research.git'}, # compile error (MRB_FIBER_RESUMING)
  # {:git => 'https://github.com/harasou/mruby-resource.git'}, # need sys/resource.h
  # {:git => 'https://github.com/emsk/mruby-romajify.git'}, # link error (onig_xxxx)
  # {:git => 'https://github.com/schmurfy/mruby-rubyffi-compat.git'}, # need ffi.h
  # {:git => 'https://github.com/haconiwa/mruby-seccomp.git'},  # build error (mkdir)
  {:git => 'https://github.com/Asmod4n/mruby-secure-compare.git'},
  # {:git => 'https://github.com/monochromegane/mruby-secure-random.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/monami-ya-mrb/mruby-serialport.git'},  # need termios.h
  {:git => 'https://github.com/yui-knk/mruby-set.git'},
  {:git => 'https://github.com/mattn/mruby-sha1.git'},
  {:git => 'https://github.com/h2so5/mruby-sha2.git'},
  # {:git => 'https://github.com/katzer/mruby-shelf.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/k0kubun/mruby-shellwords.git'},  # link error (oniguma)
  # {:git => 'https://github.com/monochromegane/mruby-sidekiq-client.git'}, # need sys/socket.h
  # {:git => 'https://github.com/pyama86/mruby-signal-thread.git'}, # build error (sigwaitinfo)
  # {:git => 'https://github.com/ksss/mruby-signal.git'}, # compile error (many errors)
  # {:git => 'https://github.com/iij/mruby-simple-random.git'}, # cmopile error (mt19937ar.c)
  {:git => 'https://github.com/y-ken/mruby-simplehttp-socket.git'},
  # {:git => 'https://github.com/matsumotory/mruby-simplehttp.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-simplehttpserver.git'},  # mkdtemp/mkstemp
  {:git => 'https://github.com/Asmod4n/mruby-simplemsgpack.git'},
  {:git => 'https://github.com/matsumotory/mruby-simpletest.git'},
  # {:git => 'https://github.com/mattn/mruby-sinatic.git'}, # need uv.h
  {:git => 'https://github.com/ksss/mruby-singleton.git'},
  {:git => 'https://github.com/ksss/mruby-siphash.git'},
  {:git => 'https://github.com/matsumotory/mruby-sleep.git'},
  # {:git => 'https://github.com/nsheremet/mruby-smallhttp.git'}, # mkdtemp/mkstemp
  # {:git => 'https://github.com/iij/mruby-socket.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/matsumotory/mruby-spdy.git'},  # autoreconf command not found
  # {:git => 'https://github.com/k0kubun/mruby-specinfra.git'}, # link erorr (onigumo)
  {:git => 'https://github.com/jbreeden/mruby-sqlite.git'},
  # {:git => 'https://github.com/mattn/mruby-sqlite3.git'}, # need sqlite3.h
  {:git => 'https://github.com/ascaridol/mruby-statemachine.git'},
  # {:git => 'https://github.com/mattn/mruby-string-crypt.git'},  # test abort
  {:git => 'https://github.com/Asmod4n/mruby-string-is-utf8.git'},
  # {:git => 'https://github.com/hanachin/mruby-string-xor.git'}, # test abort
  {:git => 'https://github.com/ksss/mruby-stringio.git'},
  # {:git => 'https://github.com/pyama86/mruby-sysconf.git'}, # test crush(1)
  # {:git => 'https://github.com/iij/mruby-syslog.git'},  # need syslog.h
  # {:git => 'https://github.com/Asmod4n/mruby-sysrandom.git'}, # link error (c++)
  # {:git => 'https://github.com/nsheremet/mruby-tbot.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/iij/mruby-tempfile.git'},  # mkdtemp/mkstemp
  # {:git => 'https://github.com/appPlant/mruby-terminal-table.git'}, # test KO(4)
  # {:git => 'https://github.com/mattn/mruby-thread.git'},  # test abort
  # {:git => 'https://github.com/monochromegane/mruby-time-strftime.git'},  # test KO(5)
  # {:git => 'https://github.com/matsumotory/mruby-timer-thread.git'},  # compile error (CLOCK_XXXX)
  # {:git => 'https://github.com/mimaki/mruby-tiny-io.git'},  # test crush(4)
  {:git => 'https://github.com/matsumotory/mruby-tinymt.git'},
  {:git => 'https://github.com/h2so5/mruby-tinyxml2.git'},
  # {:git => 'https://github.com/Asmod4n/mruby-tls.git'}, # need tls.h
  # {:git => 'https://github.com/take-cheeze/mruby-uchardet.git'},  # build error (mozilla::xxx)
  # {:git => 'https://github.com/matsumotory/mruby-uname.git'}, # need sys/utsname.h
  # {:git => 'https://github.com/keizo042/mruby-unbound.git'},  # need unbound.h
  # {:git => 'https://github.com/appPlant/mruby-unicode-display_width.git'},  # test KO(3)
  {:git => 'https://github.com/mattn/mruby-updategems.git'},
  {:git => 'https://github.com/Asmod4n/mruby-uri-parser.git'},
  {:git => 'https://github.com/matsumotory/mruby-userdata.git'},
  # {:git => 'https://github.com/mattn/mruby-uv.git'},  # need uv.h
  # {:git => 'https://github.com/mattn/mruby-v8.git'},  # need v8.h
  # {:git => 'https://github.com/matsumotory/mruby-vedis.git'}, # test crush(1)
  # {:git => 'https://github.com/matsumotory/mruby-virtualing.git'},  # need sys/wait.h
  # {:git => 'https://github.com/ppibburr/mruby-webkit-1.git'}, # need ffi.h
  # {:git => 'https://github.com/ppibburr/mruby-webkit-3.git'}, # need ffi.h
  # {:git => 'https://github.com/sdottaka/mruby-win32ole.git'},  # test abort
  {:git => 'https://github.com/mattn/mruby-winapp.git'},
  # {:git => 'https://github.com/akiray03/mruby-WiringPi.git'}, # compile error (old API ?)
  # {:git => 'https://github.com/Asmod4n/mruby-wslay' # build error (eslay_event.c)
  # {:git => 'https://github.com/hone/mruby-yaml.git'}, # curl command error
  # {:git => 'https://github.com/katzer/mruby-yeah.git'}, # mkstemp
  {:git => 'https://github.com/matsumotory/mruby-zabbix.git'},
  # {:git => 'https://github.com/jbreeden/mruby-zlib.git'}, # need zlib.h
  # {:git => 'https://github.com/zeromq/mruby-zmq.git'},  # pkg-config
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
