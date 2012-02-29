require 'metadown'
require 'sass'
Slim::Engine.set_default_options :pretty => true
Slim::Engine.default_options[:disable_escape] = true
layout 'layout.html.slim'

before 'index.html.slim' do
  @posts = Hash.new
  Dir.foreach("posts") do |file_name|
    unless file_name == '.' or file_name == '..' or file_name == 'controller.rb'
      post = Metadown.render(File.read("posts/" + file_name))
      @posts[post.metadata['title']] = "/posts/#{file_name.gsub('.markdown','')}"
    end
  end  
end

Dir.glob("posts/*.markdown").each do |file_name|
  before file_name do |file|
    post = Metadown.render(File.read("/Users/Nerian/Projects/blog/#{file_name}"))
    instead post.output
  end
end

ignore /config.ru/

