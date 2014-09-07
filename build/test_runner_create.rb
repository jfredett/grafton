#!/usr/bin/env ruby

require 'find'

def find_suites
  @suites ||= Find.find('test/suites')
                  .select { |path| File.extname(path) == '.suite' }
end

puts %{
#include <stdlib.h>
#include <check.h>
#include "check_grafton.h"
}

find_suites.each do |suite|
  puts "#include \"#{suite.gsub('test/', '')}\""
end

puts 'TEST_MAIN'

find_suites.each do |suite|
  puts "SUITE(#{File.basename(suite).gsub('.suite','')})"
end

puts 'END_TEST_MAIN'
