#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: go.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

p options
p ARGV

cm = CagesManager.new(Parser.new("cages.yml"))
cm.enter("cage1", "user1")
cm.enter("cage2", "user2")
cm.exit("cage1")
cm.exit("cage2")

p cm.state
