---
layout: post
title: "Did you know that JSON.encode doesn't respect symbols?"
---                                                            

Today was one of those days that instead of addressing myself as a programmer I entitle myself the title of 'Bug Exorcist'.

Doing bug exorcism is a very dangerous matter. Do not take it lightly for it can be your doom. The job of a Bug Exorcist is to track down devilish bugs that disguise themselves in the most elaborate ways. I will elaborate on one in particular:
                    
	ruby-1.9.2-p180 :086 > require 'json'    
                     
	# A hash that contains a string key. 
	ruby-1.9.2-p180 :065 > arra = {'cu'=>'algo'}
	 => {"cu"=>"algo"}
	# A hash that contains a symbol key.
	ruby-1.9.2-p180 :066 > arra2 = {cu: 'algo'}
	 => {:cu=>"algo"}              
	# You would say they are different, won't you?
          
	# Are you watching closely?
	ruby-1.9.2-p180 :067 > JSON.dump(arra)
	 => "{\"cu\":\"algo\"}"
	ruby-1.9.2-p180 :080 > JSON.dump(arra2)
	 => "{\"cu\":\"algo\"}"

	ruby-1.9.2-p180 :081 > JSON.parse(JSON.dump(arra)) == arra
	 => true
	ruby-1.9.2-p180 :082 > JSON.parse(JSON.dump(arra2)) == arra
	 => true
	ruby-1.9.2-p180 :086 > JSON.parse(JSON.dump(arra2)) == arra2
	 => false

	JSON.parse(JSON.dump(arra1))
	 => {"cu"=>"algo"}        
	JSON.parse(JSON.dump(arra2))
	 => {"cu"=>"algo"}
{:lang="ruby"}

Pray with me:  I shall never use symbols when I use JSON.     

And another perl: 

	ruby-1.9.2-p180 :090 > otro={5=>'algo'}
	 => {5=>"algo"} 
	ruby-1.9.2-p180 :091 > otro[5]
	 => "algo" 
	ruby-1.9.2-p180 :092 > JSON.parse(JSON.dump(otro))
	 => {"5"=>"algo"} 
	ruby-1.9.2-p180 :093 > JSON.parse(JSON.dump(otro)) == otro
	 => false     
{:lang="ruby"}

Pray with me: Never use integers 

Or any other object, for that matter:
                                   
	ruby-1.9.2-p180 :096 > persona = Person.new
	 => #<Person:0x00000101883900> 
	ruby-1.9.2-p180 :098 > mas = {persona => 'jojo'}
	 => {#<Person:0x00000101883900>=>"jojo"} 
	ruby-1.9.2-p180 :099 > mas[persona]
	 => "jojo" 

	ruby-1.9.2-p180 :101 > JSON.parse(JSON.dump(mas)) == mas
	 => false 
	ruby-1.9.2-p180 :102 > JSON.parse(JSON.dump(mas)) 
	 => {"#<Person:0x00000101883900>"=>"jojo"}
{:lang="ruby"}

Conclusion: In JSON keys are always just strings. Don't get fancy with your keys :)