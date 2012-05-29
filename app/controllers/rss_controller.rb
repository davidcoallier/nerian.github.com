class RssController < ApplicationController
  
  skip_before_filter :require_login
  
  def show
    @posts = Post.all
    render 'show.xml'
  end
  
end
