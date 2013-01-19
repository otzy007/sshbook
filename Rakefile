#!/usr/bin/env rake

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

task :default => ['spec'] 
namespace "travis" do
     desc "Test if it can connect"
   task :test_connection do
      puts "Testing the connection to localhost"
      sh %{ruby sshbook localhost uname} 
   end
end
