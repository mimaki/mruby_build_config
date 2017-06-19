`mgem update`

mgeminfo = `mgem info`

# puts mgeminfo

repolist = mgeminfo.scan /^\s*Repository:.*$/

puts repolist

repos = repolist.map {|repo|
  repo.split(' ')[1] if repo.include?(' ')
}

puts repos

File.open("all.gembox", 'w') {|f|
  f.puts 'MRuby::GemBox.new do |conf|'
  repos.each {|repo|
    f.puts "  conf.gem :git => '#{repo}'"
  }
  f.puts 'end'
}
