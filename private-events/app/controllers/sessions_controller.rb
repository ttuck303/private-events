class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = "You have logged in succesfully"
  		session[:user_id] = user.id
  		redirect_to user_path(user)
  	else
  		flash[:danger] = "Error logging in"
  		render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path
  end
end
