require 'metadown'
require 'sass'
require 'time'
Slim::Engine.set_default_options :pretty => true
Slim::Engine.default_options[:disable_escape] = true

layout 'layout.html.slim'

before 'index.html.slim' do
  @posts = Array.new
  Dir.foreach("posts") do |file_name|
    unless file_name == '.' or file_name == '..' or file_name == 'controller.rb'
      post = Metadown.render(File.read("posts/" + file_name))
      @posts << {'href' => "/posts/#{file_name.gsub('.markdown','')}" }.merge(post.metadata)
    end
  end
  @posts.sort_by!{ |post| post['date'] }.reverse!
end

layout 'rss.xml.erb' => 'none.html.slim'
before 'rss.xml.erb' do

  @posts = Array.new
  Dir.foreach("posts") do |file_name|
    unless file_name == '.' or file_name == '..' or file_name == 'controller.rb'
      post = Metadown.render(File.read("posts/" + file_name))
      post.metadata['url'] = 'http://nerian.es/' + file_name.gsub('.markdown', '')
      @posts << post.metadata
    end
  end
  @posts.sort_by!{ |post| post['date'] }.reverse!
end

Dir.glob("posts/*.markdown").each do |file_name|
  before file_name do |file|
    post = Metadown.render(File.read("/Users/Nerian/Projects/nerian.github.com/#{file_name}"))
    instead post.output
  end
end


