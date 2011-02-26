---
layout: post
title: 'The Ruby programmer stack 2: Installing Passenger with Nginx using Homebrew and RVM in Mac OS X '
---
 
Summary:

* Install RVM
* Install Nginx with Homebrew
* Install Passenger from RVM
* Configure the couple.
* Setup a Rails Project.
    

### Install RVM

{% highlight bash %}
$ bash <<(curl http://rvm.beginrescueend.com/releases/rvm-install-latest)
{% endhighlight bash %}

Close the shell and open a new one.
                 
Install ruby 1.9.2
       
{% highlight bash %}
$ rvm install 1.9.2
{% endhighlight bash %}

Set as default

{% highlight bash %}
$ rvm --default 1.9.2                                  
{% endhighlight bash %}
                                       
### Install Passenger from RVM

Install passenger and bundler in the global gemset

{% highlight bash %}
$ rvm 1.9.2@global gem install passenger bundler       
{% endhighlight bash %}
           
### Install Nginx from Homebrew

Install Nginx    
                              
{% highlight bash %}
$ brew install nginx --with-passenger
{% endhighlight bash %}

The install outputs instructions to make Nginx lauch at login:

{% highlight bash %}
$ cp /usr/local/Cellar/nginx/0.8.54/org.nginx.plist ~/Library/LaunchAgents 

$ launchctl load -w ~/Library/LaunchAgents/org.nginx.plist
{% endhighlight bash %}        

### Configure the couple                 

Decompress the source of Nginx.

{% highlight bash %}
$ cd $HOME/Library/Caches/Homebrew
$ tar xvf nginx-0.8.54.tar.gz                       
{% endhighlight bash %}
                              
Now install the Nginx module

{% highlight bash %}
$ passenger-install-nginx-module
{% endhighlight bash %}

Do chose to customise your own Nginx installation.
                                                             
Your Nginx source code is located here (change it to you user name):

{% highlight bash %}
/Users/Nerian/Library/Caches/Homebrew/nginx-0.8.54                             
{% endhighlight bash %}

Chose to install Nginx to:
{% highlight bash %}
/usr/local/Cellar/nginx/0.8.54/sbin
{% endhighlight bash %}

Click intro in the next two questions.

At the end of the install it says that it modified Nginx config file. Don't use that file.
Edit /usr/local/etc/nginx/nginx.conf and add the code snippet.
Change to your user name.
                 
{% highlight bash %}
http {
      ...
      passenger_root /Users/Nerian/.rvm/gems/ruby-1.9.2-p180@global/gems/passenger-3.0.3;
      passenger_ruby /Users/Nerian/.rvm/wrappers/ruby-1.9.2-p180/ruby;
      ...
  }                 
{% endhighlight bash %}
       

### Set up a Rails Project

Create a .rvmrc file on the root of your project. Change username and project name.

{% highlight bash %}
if [[ -s "/Users/Nerian/.rvm/environments/ruby-1.9.2-p180@DaVinci" ]] ; then
  . "/Users/Nerian/.rvm/environments/ruby-1.9.2-p180@DaVinci"
else
  rvm --create use  "ruby-1.9.2-p180@DaVinci"
fi                  
{% endhighlight bash %}


Set up load paths in your Rails 3 project. This is config/setup_load_paths.rb

{% highlight bash %}
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
{% endhighlight bash %}