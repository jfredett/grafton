#!/usr/bin/env ruby

require 'pry'

file = ARGV[0]
suite_name = File.basename(file).gsub('.c', '')
description = ARGV[1] || suite_name

tests = []
File.open(file) do |f|
  f.each_line do |line|
    next unless line =~ /START_TEST +\(([^)]+)\) {/
    tests << $1
  end
end

puts '#include "../check_grafton.h"'
puts "#include \"#{file.gsub('test/','../')}\""
puts
puts "START_TEST_SUITE(#{suite_name}, \"#{description}\")"
puts 'FIXTURE(setup, teardown)'

tests.each do |t|
  puts "TEST(#{t})"
end

puts "END_TEST_SUITE"
