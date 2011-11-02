---
layout: post
title: "Simple Gemset – because 7 seconds is a lot of time!"
---                                    
                  
## Update

Just use:

	$ rvm --create --rvmrc 1.9.3@blog
{:lang='ruby'}

That will create a very nice .rvmrc file.

<hr>

You know those situations. Every Ruby developer go through this:

* You spot an interesting Ruby project at Github
* You want to play with it, so you git clone it.
* You don't want to turn your gem space into a mess, so you lose 7 seconds typing a boring .rvmrc file that just creates a new gemset for whatever ruby version you happen to be using.
* You play with your new toy.

I don't want to lose those 7 seconds. 7 seconds are better used to make a quick tweet or visiting your Facebook profile.

simple_gemset is a gem that helps you to create such .rvmrc file.

Just like this:

    $ mkdir my_new_project
	$ cd my_new_project

	$ simple_gemset
	    create  .rvmrc               
{:lang='ruby'}
              
That generates a .rvmrc like this:

	# Generated with Simple_gemset  
	rvm gemset create 'my_new_project' # current folder
	rvm gemset use 'my_new_project'
{:lang='ruby'}

It also support setting the gemset name and/or Ruby version.

	$ simple_gemset my_gemset --ruby
	    Choose which Ruby version do you want to use
	    0: ruby-1.8.6-p420
	    1: ruby-1.8.6-head
	    2: ruby-1.8.7-p352
	    3: ruby-1.8.7-head
	    4: ruby-1.9.1-p378
	    5: ruby-1.9.1-p431
	    6: ruby-1.9.1-head
	    7: ruby-1.9.2-p180
	    8: ruby-1.9.2-p290
	    9: ruby-1.9.2-head
	    10: ruby-1.9.3-head
	    11: ruby-head
	    12: goruby
	    13: jruby-1.2.0
	    14: jruby-1.3.1
	    15: jruby-1.4.0
	    16: jruby-1.6.1
	    17: jruby-1.6.2      
	    Which ruby? Just tell me the number: 7

	    create  .rvmrc                        	
{:lang='ruby'}

Which generates a .rvmrc file like this:	      

    	# Generated with Simple_gemset
    	rvm use 'ruby-1.9.2-p180'
    	rvm gemset create 'my_gemset'
    	rvm gemset use 'my_gemset'                          	
{:lang='ruby'}             


Install it with:

    $ gem install 'simple_gemset'
{:lang='ruby'}          

Code and further examples at:

[https://github.com/Nerian/simple_gemset](https://github.com/Nerian/simple_gemset)