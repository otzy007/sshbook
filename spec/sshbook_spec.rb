require 'spec_helper'

describe Actions do 
   before :each do
      $HOSTS_FILE = '/tmp/sshbook.yml'
      ARGV = nil
   end
   describe  "add a connection" do
      it 'adds a simple connection' do
	 ARGV = "-a name user@host".split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'host' => 'host', 'options' => nil, 'command' => nil})
      end
      
      it 'adds a connection with options' do
	 ARGV = "-a -o -Y name user@host".split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'host' => 'host', 'options' => '-Y', 'command' => nil})
      end
      
      it 'adds a connection with a script' do
	 ARGV = "-a -s script name user".split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'script' => 'script', 'options' => nil, 'command' => nil})
      end
      
      it 'adds a connection with a script and options' do
	 ARGV = "-a -s script -o option name user".split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'script' => 'script', 'options' => 'option', 'command' => nil})
	 
	 ARGV = "-a -o option -s script name user".split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'script' => 'script', 'options' => 'option', 'command' => nil})
      end
      
      it 'shouldn\'t add  a connection without the host' do
	 ARGV = "-a lol".split
	 begin
	    Actions.new.add
	 rescue SystemExit => e
	 end
	 e.class.should eq SystemExit
      end
      
      it 'should add a connection with a command' do
	 ARGV = '-a -c ls connection user@host'.split
	 Actions.new.add
	 $hosts['connection'].should eq({'user' => 'user', 'host' => 'host', 'options' => nil, 'command' => 'ls'})
      end
      
      it 'should add a command to a scripted connection' do
	 ARGV = '-a -c ls -o option -s script name user'.split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'script' => 'script', 'options' => 'option', 'command' => 'ls'})
      end
      
      it 'should add a connection only with the hostname' do
	 ARGV = '-a name host'.split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => ENV['user'], 'host' => 'host', 'options' => nil, 'command' => nil})
      end
      
   end
   describe 'delete a connection' do
      it 'should delete a connection based on it\'s name' do
# 	 $hosts = Hash.new
	 $hosts['name'] = {'user' => 'user', 'host' => 'host', 'options' => '-Y'}
	 ARGV = '-d name'.split
	 Actions.new.delete
	 $hosts['name'].should eq nil
      end
   end
end
