class HomeController < ApplicationController
  
  skip_before_filter :require_login
  
  def index
    @posts = Post.all.order_by([:publish_date => :desc])
  end
end
