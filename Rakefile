#!/usr/bin/env rake

namespace "travis" do
   desc "Run tests"
   task :test do
      puts "Testing the connection to localhost"
      sh %{ruby sshbook localhost ls}
   end
end