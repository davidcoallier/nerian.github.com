---
layout: post
title: 'Lighting fast tests with Spork on a Mongoid project'
date: 2011-2-28
---                                                                          

# Lighting fast tests with Spork on a Mongoid project

## Summary:

* We are going to set up a Rails 3 project using Mongoid and Spork.
* The full project is in [github](https://github.com/Nerian/Mongoid-spork-Rails-app-example 'github')

## Introduction:

MongoDB is a document oriented database. To sum it up what it means: Flexibility. 

Mongoid is a ODM that harness the power of MongoDB in a very elegant way. Its power lies around a very good documentation and an active community.

Spork is a gem designed to allow you to run your spec very quickly. How does it do that? It preloads your Rails environment. You'll notice a difference in that your testing starts right away, instead of waiting a few seconds.

## Create a Rails project:
                               

	$ rails new mongoid-spork-example                                       

Configure RVM       

	$ cd mongoid-spork-example
	$ echo "rvm gemset create mongoid-example \nrvm gemset use mongoid-example" >> .rvmrc
                    
Configure Gemfile      
           
	gem 'rails', '3.0.4'                                                     
	gem "mongoid", "2.0.0.rc.7"
	gem 'bson_ext'
	group :development, :test do
	  gem 'rspec-rails'
	  gem 'spork', '~> 0.9.0.rc' # It's important to use the rc version 
	end              
               
Install gems

	$ bundle install       

Generate mongoid configuration file:

	$ rails generate mongoid:config

Empty config/database.yml

Open config/application and comment the line require 'rails/all'. Add the rest:

	#require 'rails/all' 
	require "action_controller/railtie"
	require "action_mailer/railtie"
	require "active_resource/railtie"
	require "rails/test_unit/railtie"  
      
Run RSpec generator

	rails g rspec:install

Run the Spork generator. This changes the spec/spec_helper.rb

	$ spork --bootstrap          

Configure spec/spec_helper.rb
            
	require 'rubygems'
	require 'spork'

	Spork.prefork do
	  # Loading more in this block will cause your tests to run faster. However,
	  # if you change any configuration or code from libraries loaded here, you'll
	  # need to restart spork for it take effect.
	  ENV["RAILS_ENV"] ||= 'test'
	  require File.expand_path("../../config/environment", __FILE__)
	  require 'rspec/rails'     
	  require 'capybara/rails'
  
	  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

	  RSpec.configure do |config|
	    config.mock_with :rspec    

	    #Add this following line to get spork working with rails 3
	    ActiveSupport::Dependencies.clear
	  end

	end

	Spork.each_run do
	  # This code will be run each time you run your specs.

	  load "#{Rails.root}/config/routes.rb"
	  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }

	end           

In order to configure Rspec to always use Spork we need to edit mongoid-spork-example/.rspec. Create it if it doesn't exist.

	--colour
	--drb
                    
We have everything setup now. Let run the tests! Open new tab and go to the directory where you have your app. Start Spork.            

	$ spork
  
Now run the tests from another tab.

	$ rspec spec 

Instant start ^_^
