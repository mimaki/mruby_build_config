require 'csv'

INFOLINES = 8

`mgem update`
mgeminfo = `mgem info`
# puts mgeminfo

repolist = mgeminfo.lines.each_slice(INFOLINES).to_a
# p repolist

repos = []
repolist.map {|repo|
  repos << [
    repo[1].split(' ')[1],                # Name
    repo[2].split(' ')[1..-1].join(' '),  # Author
    repo[3].split(' ')[1..-1].join(' '),  # Description
    repo[4].split(' ')[1],                # Website
    repo[5].split(' ')[1],                # Repository
    repo[6].split(' ')[2..-1].join(' '),  # Repo Options
    repo[7].split(' ')[1],                # Protocol
  ] if repo.size == INFOLINES
}
# p repos.sort_by {|repo| repo[0].downcase}

# generate CSV
CSV.open("mgemlist.csv", "wb") {|csv|
  csv << [
    'Name', 'Author', 'Description', 'Website',
    'Repository', 'Repo Options', 'Protocol'
  ]
  repos.sort_by! {|repo| repo[0].downcase}
  repos.each {|repo| csv << repo}
}
