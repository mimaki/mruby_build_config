require 'csv'

OS_NUM = 6        # Number of OSs
RESULT_BASE = 7   # Index of 1st OS's result base

def write_table_header(html)
  # Write header
  html.puts <<EOS
<table align="center" border="1">
  <tr>
    <th rowspan="3">Name</th>
    <th rowspan="3">Description</th>
    <th colspan="6">Platform</th>
  </tr>
  <tr>
    <th rowspan="2">macOS</th>
    <th rowspan="2">Ubuntu Linux</th>
    <th colspan="4">Windows</th>
  </tr>
  <tr>
    <th>Visual C++</th>
    <th>MinGW</th>
    <th>Cygwin</th>
    <th>WSL (Bash)</th>
  </tr>
EOS
end

#------
# main
#------

unless ARGV.size > 0
  puts <<EOS
Usage: #{$0} <csv>
  csv: CSV file of test result.
EOS
  exit -1
end

begin
  # Load result.csv
  result = CSV.read ARGV[0]
  3.times {result.delete_at(0)}

  # Make mgemlist.csv
  `ruby mgemcsv.rb`

  # Load mgemlist.csv
  csv = CSV.read 'mgemlist.csv'
  csv.delete_at(0)

  # Add result
  csv.each_with_index {|repo, i|
    if res = result.find {|r| r[0] == repo[0]}
      OS_NUM.times {|i|
        repo << res[RESULT_BASE + i * 2]
      }
    else
      puts "*** #{repo[0]} not found. ***"
    end
  }

  # Generate HTML
  lines = 0
  File.open("mgemlist.html", "w") {|html|
    # Write table header
    write_table_header(html)

    # Write table body
    csv.each {|repo|
      res = repo[-OS_NUM..-1]
      puts "#{res} #{repo[0]}" if $DEBUG
      next if res.join.size == 0

      lines += 1

      html.puts <<EOS
  <tr><td><a href="#{repo[3]}" target="_blank">#{repo[0]}</a></td>
  <td>#{repo[2]}</td>
EOS
      html.print '  '
      OS_NUM.times {|i|
        html.print "<td align=\"center\"> #{repo[-OS_NUM+i]} </td>"
      }
      html.puts "</tr>"
    }
    html.puts <<EOS
</table>
EOS
  }

  puts "Total mgems:  #{csv.size}"
  puts "Output mgems: #{lines}"

rescue => e
  p e
  exit -1
end
