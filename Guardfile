# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
require 'terminal-notifier'
guard :shell do
  watch(/(.*)\.[ch]/) do |m|
    puts "#{m[0]} changed, building"
    if system('make check')
      TerminalNotifier.notify('Tests Passed')
    else
      TerminalNotifier.notify('Tests Failed')
    end
  end
end

guard :shell do
  watch(/(.*)\.[ch]/) do |m|
    puts "#{m[0]} changed, generating tags"
    system('ctags -R .')
  end
end

guard :bundler do
  watch('Gemfile')
end
