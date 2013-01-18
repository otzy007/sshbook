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
	 $hosts['name'].should eq({'user' => 'user', 'host' => 'host', 'options' => nil})
      end
      
      it 'adds a connection with options' do
	 ARGV = "-a -o -Y name user@host".split
	 Actions.new.add
	 $hosts['name'].should eq({'user' => 'user', 'host' => 'host', 'options' => '-Y'})
      end
      
      it 'adds a connection with a script' do
	 ARGV = "-a -s script name".split
	 Actions.new.add
	 $hosts['name'].should eq({'script' => 'script', 'options' => nil})
      end
      
      it 'adds a connection with a script and options' do
	 ARGV = "-a -s script -o option name".split
	 Actions.new.add
	 $hosts['name'].should eq({'script' => 'script', 'options' => 'option'})
	 
	 ARGV = "-a -o option -s script name".split
	 Actions.new.add
	 $hosts['name'].should eq({'script' => 'script', 'options' => 'option'})
      end
      
      it 'shouldn\'t add  a connection without the host' do
	 ARGV = "-a lol".split
	 begin
	    Actions.new.add
	 rescue SystemExit => e
	 end
	 e.class.should eq SystemExit
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
