require 'fileutils'
require "open3"
require 'csv'
require 'erb'

# constants
CURDIR = `cd`.chomp
LOGDIR = File.join(CURDIR, 'log')
MRBDIR = File.expand_path(File.join(CURDIR, '..', 'mruby'))

# MRBGEM class
class MRBGEM
  @@verbose = false
  attr_reader :name, :author, :desc, :site, :repo, :opt, :prot, :config
  
  def initialize(*args)
    # ["Name", "Author", "Description", "Website", "Repository", "Repo Options", "Protocol"]
    @name, @author, @desc, @site, @repo, @opt, @prot = *args
    @logdir = File.join(LOGDIR, @name)
    @logfile = File.join(@logdir, 'mgemtest.log')
  end

  def self.verbose=(v=true)
    @@verbose = v
  end

  def make_config
    # make log dir
    FileUtils.mkdir_p @logdir

    # make build_config
    build_config = ERB.new(File.read('./mgem_build_config.erb')).result
    puts build_config if $DEBUG
    File.open(File.join(@logdir, 'mgem_build_config.rb'), 'w') {|f|
      f.write(build_config)
    }
  end

  # def make_makefile
  #   # make Makefile
  #   # @config = File.join('../mruby_build_config', @logdir, 'mgem_build_config.rb')
  #   makefile = ERB.new(File.read('./Makefile.erb')).result
  #   puts makefile if $DEBUG
  #   File.open(File.join(@logdir, 'Makefile'), 'w') {|f|
  #     f.write(makefile)
  #   }
  # end

  # def make_test_bat
  #   # make test.bat
  #   # @config = File.join('../mruby_build_config', @logdir, 'mgem_build_config.rb')
  #   test_bat = ERB.new(File.read('./test_bat.erb')).result
  #   puts test_bat if $DEBUG
  #   File.open(File.join(@logdir, 'testmgem.bat'), 'w') {|f|
  #     f.write(test_bat)
  #   }
  # end

  def make_test_script
    # make Makefile / testmgem.bat
    # @config = File.join('../mruby_build_config', @logdir, 'mgem_build_config.rb')
    @config = File.join(@logdir, 'mgem_build_config.rb')
    # make_makefile
    # make_test_bat
  end

  def test
    # config = File.join('../mruby_build_config', @logdir, 'mgem_build_config.rb')
    puts "logfile: #{@logfile}" if @@verbose
    File.open(@logfile, "w") {|log|
      # `cd #{MRBDIR}`
      begin
        rakefile = File.join(MRBDIR, 'Rakefile')
        puts "Rakefile: #{rakefile}" if @@verbose
        # Open3.popen3("MRUBY_CONFIG=#{config} make -C ../mruby test") {|_i, o, e, w|
        # Open3.popen3("make -C #{@logdir}") {|_i, o, e, w|
        Open3.popen3({'MRUBY_CONFIG' => @config}, 'rake', '-f', rakefile, 'clean', 'all', 'test') {|_i, o, e, w|
          o.each {|line|
            puts line if @@verbose
            log.puts line
          }
          e.each {|line|
            puts line if @@verbose
            log.puts line
          }
          puts w.value if @@verbose
          log.puts w.value
        }
      rescue => e
        log.puts e
      end
    }
  rescue => e
    p e
  end

  def cleanup
    FileUtils.rm_rf File.join(MRBDIR, 'build', "test-#{@name}")
    FileUtils.rm_rf File.join(MRBDIR, 'build', 'repos', "test-#{@name}")
  end

  def parse_result(key)
    begin
      `grep #{sprintf("%7s:", key)} #{@logfile}`.lines.map {|ln|
        ln[8..-1].to_i
      }
    rescue  # for Windows
      `find #{sprintf("%7s:", key).inspect} #{@logfile}`.lines[2..-1].map {|ln|
        ln[8..-1].to_i
      }
    end
  end

  def tail(file, lines=3)
    logs = File.readlines(file)
    logs[-lines, lines].join
  end

  def result
    res = ''
    keys = ['OK', 'KO', 'Crash', 'Warning', 'Skip']
    results = keys.map {|key|
      parse_result(key)
    }
    cnt = results[0].size
    if cnt > 0
      res = "         test  #{cnt > 1 ? 'bin' : ''}\n"
      keys.each_with_index {|key, i|
        res << sprintf("%7s:", key)
        cnt.times {|j|
          res << sprintf(" %4d", results[i][j])
        }
        res << "\n"
      }
    else
      res = tail(@logfile)  #`tail -n 3 #{@logfile}`
    end
    res
  end
end

#
# main
#

start = ARGV[0] ? ARGV[0].to_i : 1
start = 1 if start < 1

mrbgems = CSV.read('mgemlist.csv', encoding: 'utf-8')
mrbgems.delete_at(0)  # delete header
count = ARGV[1] ? ARGV[1].to_i : mrbgems.size

_mrbgem = nil
MRBGEM.verbose = $DEBUG

# test mrbgems
mrbgems[start-1, count].each_with_index {|mgem, i|
  _mrbgem = MRBGEM.new(*mgem)

  title = "#{Time.now.strftime('%H:%M:%S')} [#{start+i}/#{mrbgems.size}] << #{_mrbgem.name} >>"
  puts title
  
  _mrbgem.make_config
  _mrbgem.make_test_script

  _mrbgem.test
  _mrbgem.cleanup

  result = _mrbgem.result
  puts result
  puts
}
