class LoginController < ApplicationController
  def create
    if user = User.find_by(:username => params[:username]).try(:authenticate , params[:password])
      session[:user_id] = user.id if user.id
      redirect_to root_url, :notice => 'You have been successfully logged in!!!'
    else
      redirect_to root_url, :alert => 'Your username or password is wrong. Try again!!!'
    end
  end

  def index
    session[:user_id] = nil
    redirect_to root_url
  end
end
