---
layout: post
title: "A new website"
---                  

If there is something Apple taught the world is that the most important thing is not really creating something new, but evolve, redesign, refactor what it is already in front of you.

Half a year ago I created this blog. It was intended to be just a mere diary, a chronology of events, regarding my adventure amid the Ruby lands.       

I decided at that moment that I wanted my blog to be developed in Ruby. I used Jekyll, a static site generator and Github pages to host it.

Today I am launching a new site. Totally resigned in style, core and principles. 

I still use Jekyll to generate the contents, but it is no longer served by Github. It is now served by a pure Rack application hosted at Heroku.

The config.ru looks like this:

	require 'rack/contrib/try_static'
	use Rack::TryStatic, 
	    :root => "_site",  # static files root dir
	    :urls => %w[/],     # match all requests 
	    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
	# otherwise 404 NotFound
	run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}
{:lang='ruby'}

Also I switched from using Pygments to using Coderay. I use this awesome [style sheet](https://github.com/Nerian/nerian.github.com/blob/master/css/coderay.css)

And finally I switched from Markdown to Kramdown. Styling code blocks is quite appealing. This how the previous block of code is styled:

	#Kramdown with coderay:
		require 'rack/contrib/try_static' 
		use Rack::TryStatic, 
		    :root => "_site",  # static files root dir
		    :urls => %w[/],     # match all requests 
		    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially
		# otherwise 404 NotFound
		run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}		
	{:lang='ruby'}
{:lang='ruby'}
                               
And finally I bought a domain name with my nickname :)

The new website resides at [nerian.es](http://nerian.es) and the code is at [github](https://github.com/Nerian/nerian.github.com)