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

task default: %w{all_reports}

desc "Generate & show a list of org admins"
task admins: [:prereq] do
  job = "admins"
  outfile = "#{@vars['org']}-#{job}.md"
  ruby "scripts/export-#{job}.rb", verbose: false
  sh "cat #{outfile}", verbose: false
end

desc "Generate all reports"
task all_reports: [:prereq] do
  FileList["scripts/export*.rb"].each { |file| ruby file, verbose: false }
end

desc "Clean all output files"
task clean: [:prereq] do
  reportfiles = @vars['reports'].map{ |r| "#{@vars['org']}-#{r}" }
  reportfiles.each do |r|
   rm_f "#{r}"
  end
end

desc "Generate a & show a list of org members"
task members: [:prereq] do
  job = "members"
  outfile = "#{@vars['org']}-#{job}.md"
  ruby "scripts/export-#{job}.rb", verbose: false
  sh "cat #{outfile}"
end

task :prereq do
  ENV['OCTOKIT_ACCESS_TOKEN'] = File.read(".token").chomp
  require 'yaml'
  @vars = YAML.load_file("scripts/vars.yaml")
end

desc "Generate a repositories report"
task repos: [:prereq] do
  ruby "scripts/export-org-repos.rb", verbose: false
end

desc "Generate & show a list of humans without 2FA enabled"
task twofa: [:prereq] do
  job = "no2fa"
  outfile = "#{@vars['org']}-members-#{job}.md"
  ruby "scripts/export-#{job}.rb", verbose: false
  sh "cat #{outfile}", verbose: false
end
