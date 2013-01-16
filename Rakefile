#!/usr/bin/env rake

task :default => ['travis:test_connection'] 
namespace "travis" do
     desc "Test if it can connect"
   task :test_connection do
      puts "Testing the connection to localhost"
      sh %{ruby sshbook localhost ls}
   end
end