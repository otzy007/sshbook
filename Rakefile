#!/usr/bin/env rake

task :default => ['travis:test_connection'] 
namespace "travis" do
     desc "Test if it can connect"
   task :test_connection do
      puts "Testing the connection to localhost"
      a = sh %{ruby sshbook localhost uname}
      exit 1 if a != 'Linux'	 
   end
end