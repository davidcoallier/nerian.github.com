---
layout: post
title: "My favourite testing tools: Because I test them too :)"
---

1. __RSpec__: I love the RSpec project. It is intuitive and has great documentation. It is the second gem I add in all my projects. 

2. __Steak__: I learnt Ruby at the same time I was learning about testing. I read The RSpec Book, by the Pragmatic programmers. In that book they teach you, among other things, Cucumber. Cucumber is a domain language for specifying executable requirements (tests) at a very high level of abstraction. They are supposed to be written by the non technical client. I found it too cumbersome so I searched for a simpler alternative. There you have: Steak. Pure RSpec. 

3. __Capybara__: So you have tests, now we need to run them. Capybara provides you with a very clean api to assert things about the page. I use the driver Capybara-webkit.

4. __Fabrication__: Easy and fast creation of objects. It works with Mongoid too :) 

5. __Spork__: It preloads the Rails environment, so test are ran instantly. Very very handy. 

6. __guard-rspec__: This little gem takes care of executing the appropriate tests each time I modify a file in my project. I make use of its integration with Growl. It is really cool of develop this way, constantly getting feedback about the project's state.

7. What would __you__ add to this sweet melange?


* [https://www.relishapp.com/rspec](https://www.relishapp.com/rspec)
* [https://github.com/cavalle/steak](https://github.com/cavalle/steak)
* [https://github.com/jnicklas/capybara](https://github.com/jnicklas/capybara)
* [https://github.com/paulelliott/fabrication](https://github.com/paulelliott/fabrication)
* [https://github.com/timcharper/spork](https://github.com/timcharper/spork)
* [https://github.com/guard/guard-rspec](https://github.com/guard/guard-rspec)