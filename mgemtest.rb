require 'fileutils'
require "open3"
require 'csv'
require 'erb'

# constants
LOGDIR = './log'

# MRBGEM class
class MRBGEM
  @@verbose = false
  attr_reader :name, :author, :desc, :site, :repo, :opt, :prot
  
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
    puts config if $DEBUG
    File.open(File.join(@logdir, 'mgem_build_config.rb'), 'w') {|f|
      f.write(build_config)
    }
  end

  def test
    config = File.join('../mruby_build_config', @logdir, 'mgem_build_config.rb')
    File.open(@logfile, "w") {|log|
      begin
        Open3.popen3("MRUBY_CONFIG=#{config} make -C ../mruby test") {|_i, o, e, w|
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

  def parse_result(key)
    `grep #{sprintf("%7s:", key)} #{@logfile}`.lines.map {|ln|
      ln[8..-1].to_i
    }
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
      res = `tail -n 3 #{@logfile}`
    end
    res
  end
end

#
# main
#

mrbgems = CSV.read 'mgemlist.csv'
mrbgems.delete_at(0)  # delete header

_mrbgem = nil
MRBGEM.verbose = $DEBUG

# test mrbgems
mrbgems.each_with_index {|mgem, i|
  _mrbgem = MRBGEM.new(*mgem)

  title = "[#{i+1}/#{mrbgems.size}] << #{_mrbgem.name} >>"
  puts title
  
  _mrbgem.make_config

  _mrbgem.test

  result = _mrbgem.result
  puts result
  puts
}
