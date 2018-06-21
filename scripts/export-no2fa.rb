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

require_relative 'common'

members = Octokit.org_members @vars['org'], :filter => "2fa_disabled"

outfile = "#{@vars['org']}-members-no2fa.md"

title = "### Org Members with 2FA Off"

CSV.open("#{outfile}", "wb") do |csv|
  csv << [ title ]
  members.each do |m|
    unless @vars['botroster'].include?(m[:login])
      csv << [ m[:login].prepend("- ") ]
    end
  end
end

line_count = %x{wc -l "#{outfile}"}.split.first.to_i
if line_count == 1
  goodnews = "### Looks like all human members have 2FA on as of the last run."
  File.open("#{outfile}", 'wb') do |c|
    c << goodnews
  end
end
