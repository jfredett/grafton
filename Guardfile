# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard :shell do
  watch(/(.*)\.[ch]/) do |m|
    puts "saw #{m} change"
    system('make check')
  end
end
