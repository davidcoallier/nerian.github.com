---
layout: post
title: "Did you known that JSON.encode doesn't respect symbols?"
---                                                            

Today was one of those days that instead of addressing myself as a programmer I entitle myself the title of 'Bug Exorcist'.

Doing bug exorcism is a very dangerous matter. Do not take it lightly for it can be your doom. The job of a Bug Exorcist is to track down devilish bugs that disguise themselves in the most elaborate ways. I will elaborate on one in particular:
   

{% highlight bash %}                   

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
{% endhighlight bash %}

Pray with me:  I shall never use symbols when I use JSON.