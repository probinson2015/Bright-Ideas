class SessionsController < ApplicationController
  def new
  end

   def create
  	user = User.find_by(:email => params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/ideas"
  	else
  		flash[:error] = "Invalid credentials"
  		redirect_to '/sessions/new'
  	end
  end

  def destroy
    session.clear
    redirect_to "/"
  end
end
