#!/usr/bin/env ruby

require "./lib/Mission"

puts Mission.new(File.open(ARGV.first, File::RDONLY).read).rover_positions_as_string