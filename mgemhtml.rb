INFOLINES = 8

`mgem update`
mgeminfo = `mgem info`
# puts mgeminfo

repolist = mgeminfo.lines.each_slice(INFOLINES).to_a
# p repolist

# generate CSV
File.open("mgemlist.html", "wb") {|html|
  html.puts <<EOS
<table align="center" border="1">
  <tr>
    <th rowspan="3">Name</th>
    <th rowspan="3">Description</th>
    <th colspan="6">Platform</th>
  </tr>
  <tr>
    <th rowspan="2">macOS</th>
    <th rowspan="2">Ubuntu Linx</th>
    <th colspan="4">Windows</th>
  </tr>
  <tr>
    <th>Visual C++</th>
    <th>MinGW</th>
    <th>Cygwin</th>
    <th>WSL (Bash)</th>
  </tr>
EOS
  repolist.each {|repo|
    if repo.size == INFOLINES
      html.puts <<EOS
  <tr><td><a href="#{repo[4].split(' ')[1]}" target="_blank">#{repo[1].split(' ')[1]}</a></td>
  <td>#{repo[3].split(' ')[1..-1].join(' ')}</td>
  <td align="center"></td><td align="center"></td><td align="center"></td><td align="center"></td><td align="center"></td><td align="center"></td></tr>
EOS
  #     repo[1].split(' ')[1],                # Name
  #     repo[2].split(' ')[1..-1].join(' '),  # Author
  #     repo[3].split(' ')[1..-1].join(' '),  # Description
  #     repo[4].split(' ')[1],                # Website
  #     repo[5].split(' ')[1],                # Repository
  #     repo[6].split(' ')[2..-1].join(' '),  # Repo Options
  #     repo[7].split(' ')[1],                # Protocol
  #   ] if repo.size == INFOLINES
    end
  }
  html.puts <<EOS
</table>
EOS
}
