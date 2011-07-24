---
layout: post
title: 'Installing Passenger with Nginx using Homebrew and RVM in Mac OS X'
---
 
### Summary:

* Install RVM.
* Install Nginx with Homebrew.
* Install Passenger from RVM.
* Configure the couple.
* Setup a Rails Project.  

### Introduction

Running __rails s__ every time we want to start a Ruby on Rails server is a waste of time and terminal tabs. The best way is to use Phusion Passenger. Phussion Passenger enables us to just go to http://davinci.dev and find the server. It is automatically started. On demand.    

### Install RVM


	$ bash < < ( curl http://rvm.beginrescueend.com/releases/rvm-install-latest )
{:lang="bash"}

Add this snippet to the end of your .bash_profile or .zshrc
              
                                             
	# This loads RVM into a shell session.
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  
{:lang="bash"}

Close the shell and open a new one.
                 
Install ruby 1.9.2
       

	$ rvm install 1.9.2
{:lang="bash"}

Set as default


	$ rvm --default 1.9.2                                  
{:lang="bash"}
                                       
### Install Passenger from RVM

Install passenger and bundler in the global gemset

	$ rvm 1.9.2@global gem install passenger bundler       
{:lang="bash"}
           
### Install Nginx from Homebrew

Install Nginx    
                              

	$ brew install nginx --with-passenger
{:lang="bash"}

The install outputs instructions to make Nginx lauch at login:


	$ cp /usr/local/Cellar/nginx/1.0.0/org.nginx.plist ~/Library/LaunchAgents/

	$ launchctl load -w ~/Library/LaunchAgents/org.nginx.plist
{:lang="bash"}

### Configure the couple                 

Decompress the source of Nginx.

	$ cd $HOME/Library/Caches/Homebrew
	$ tar xvf nginx-1.0.0.tar.gz
{:lang="bash"}
                              
Now install the Nginx module

	$ passenger-install-nginx-module
{:lang="bash"}

Do chose to customise your own Nginx installation.
                                                             
Your Nginx source code is located here (change it to you user name):

	/Users/Nerian/Library/Caches/Homebrew/nginx-1.0.0                             
{:lang="bash"}

Chose to install Nginx to:

	/usr/local/Cellar/nginx/1.0.0/sbin
{:lang="bash"}

Click intro in the next two questions.

At the end of the install it says that it modified Nginx config file. Don't use that file.
Edit /usr/local/etc/nginx/nginx.conf and add the code snippet.
Change user name and/or passenger version.
                 

	http {
	      ...
	      passenger_root /Users/Nerian/.rvm/gems/ruby-1.9.2-p180@global/gems/passenger-3.0.6;
	      passenger_ruby /Users/Nerian/.rvm/wrappers/ruby-1.9.2-p180/ruby;
	      ...
	  }                 
{:lang="bash"}
       

### Set up a Rails Project

Add an entry to /usr/local/etc/nginx/nginx.conf. Notice that we can set the rails_env. In my case, I like to start the server on the development environment, that way the sources are reloaded every request. Very handy on the development machine. 


	server {
	      listen 8081;
	      server_name davinci.dev;
	      root /Users/Nerian/NetBeansProjects/DaVinci/public;
	      passenger_enabled on;
		  rails_env development;   
	   }                
{:lang="bash"}



Create a .rvmrc file on the root of your project. Change username and project name.

	if [[ -s "/Users/Nerian/.rvm/environments/ruby-1.9.2-p180@DaVinci" ]] ; then
	  . "/Users/Nerian/.rvm/environments/ruby-1.9.2-p180@DaVinci"
	else
	  rvm --create use  "ruby-1.9.2-p180@DaVinci"
	fi                  
{:lang="bash"}


Set up load paths in your Rails 3 project. This is config/setup_load_paths.rb

	if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
	  begin
	    rvm_path     = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
	    rvm_lib_path = File.join(rvm_path, 'lib')
	    $LOAD_PATH.unshift rvm_lib_path
	    require 'rvm'
	    RVM.use_from_path! File.dirname(File.dirname(__FILE__))
	  rescue LoadError
	    # RVM is unavailable at this point.
	    raise "RVM ruby lib is currently unavailable."
	  end
	end           
{:lang="bash"}

How do I see the logs of my application?  

	$ cd yourapp/
	$ tail -f log/development.log
{:lang="bash"}

How do I restart my application?

	$ touch yourapp/tmp/restart.txt
{:lang="bash"}