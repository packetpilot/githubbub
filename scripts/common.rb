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
require 'csv'
require 'octokit'
require 'yaml'

# Load variables from vars.yaml as instance variables
@vars = YAML.load_file("scripts/vars.yaml")

Octokit.auto_paginate = true

# Authenticate
client = Octokit::Client.new
