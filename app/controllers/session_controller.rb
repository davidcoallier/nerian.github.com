class SessionController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
  end

  def create
    if login('username', params[:password])
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path)
  end
end
