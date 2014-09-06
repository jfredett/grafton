#!/usr/bin/env ruby


puts %{
#include <stdlib.h>
#include <check.h>
#include "check_grafton.h"
}

Dir['test/suites/*.suite'].each do |suite|
  puts "#include \"#{suite.gsub('test/', '')}\""
end

puts 'TEST_MAIN'

Dir['test/suites/*.suite'].each do |suite|
  puts "SUITE(#{File.basename(suite).gsub('.suite','')})"
end

puts 'END_TEST_MAIN'
