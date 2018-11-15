#!/usr/bin/ruby

file_name = ARGV[0]
abort "Please specify the file name of the request log - e.g. ./parser.rb webserver.log" unless file_name

require './lib/log_parser'

metrics = LogParser.new(file_name)
padding = metrics.most_visits.map {|visit| visit[0].length}.max

puts "Most visits:"
metrics.most_visits.each do |visit|
  puts "#{visit[0].ljust(padding)} #{visit[1]} visits"
end

puts "\nUnique views:"
metrics.most_unique_visits.each do |visit|
  puts "#{visit[0].ljust(padding)} #{visit[1]} unique views"
end
