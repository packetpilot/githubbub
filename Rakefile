#!/usr/bin/env ruby

task default: %w{all_reports}

desc "Generate & show a list of org admins"
task :admins do
  Rake::Task[:prereq].invoke
  ruby "scripts/export-admins.rb", verbose: false
  sh "cat #{@vars['org']}-admins.md", verbose: false
end

desc "Generate all reports"
task :all_reports do
  Rake::Task[:prereq].invoke
  FileList["scripts/export*.rb"].each { |file| ruby file, verbose: false }
end

desc "Clean all output files"
task :clean do
  Rake::Task[:prereq].invoke
  rm "#{@vars['org']}-admins.md"
  rm "#{@vars['org']}-members-no2fa.md"
  rm "#{@vars['org']}-members.md"
  rm "#{@vars['org']}-repos.md"
end

desc "Generate an org members list"
task :members do
  Rake::Task[:prereq].invoke
  ruby "scripts/export-members.rb", verbose: false
end

task :prereq do
  ENV['OCTOKIT_ACCESS_TOKEN'] = File.read(".token").chomp
  require 'yaml'
  @vars = YAML.load_file("scripts/vars.yaml")
end

desc "Generate a repositories table"
task :repos do
  Rake::Task[:prereq].invoke
  ruby "scripts/export-org-repos.rb", verbose: false
end

desc "Generate & show a list of humans without 2FA enabled"
task :twofa do
  Rake::Task[:prereq].invoke
  ruby "scripts/export-no2fa.rb", verbose: false
  sh "cat #{@vars['org']}-members-no2fa.md", verbose: false
end
