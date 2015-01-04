class SignupController < ApplicationController
  def index

  end

  def create
    if params[:password].eql? params[:passwordConfirmation]
puts params
      user = User.create(:username => params[:username], :password => params[:password])
      if user && user.id
        session[:current_user] = user.id
        redirect_to root_url, :notice => 'You have been redirected!!!'
      else
        redirect_to root_url, :alert => 'This username is occupied!!!'
      end
    else
      redirect_to root_url, :alert => 'Your passwords are different!!!'
    end
  end
end
