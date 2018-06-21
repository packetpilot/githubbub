#!/usr/bin/env ruby

# Copyright 2018 packetpilot <point.it@howiget.email>
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#!/usr/bin/env ruby

require_relative 'common'

repos = Octokit.org_repos @vars['org']

outfile = "#{@vars['org']}-repos.md"

repofields = @vars['repofields']

CSV.open("#{outfile}", "wb",
  :col_sep => '|',
  :headers => repofields,
  :write_headers => true
  ) do |csv|
    csv << Array.new(repofields.length, "---")
    repos.each_with_index do |r, i|
      # this needs work.
      fields = repofields.map{ |f| eval "r[:#{f}]" }.join('|')
      csv << [ fields ]
      # repeat the headers.
      csv << repofields if (i + 1) % 10 == 0
    end
end
