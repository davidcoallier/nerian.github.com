class PostsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:show]
  
  def show
    @post = Post.find(params[:id])
    render
  end
  
  def index
    @posts = Post.all.order_by([:publish_date => :desc])
  end
  
  def draft
    render
  end
  
  def edit
    @post = Post.find(params[:id])
    render    
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to posts_path
  end
  
  def new
    @post = Post.new
    render 'new'
  end
  
  def create
    @post = Post.new(params[:post])
    @post.save
    redirect_to root_path
  end
end
