class UsersController < ApplicationController
 def create
    user = User.new(name: params[:name], email: params[:email], alias: params[:alias], password: params[:password], password_confirmation: params[:confirm_password])
      if user.valid?
      	user.save
    	  session[:user_id] = user.id
    	  flash[:success]  = "Account created successfully. Please login!"
    	  redirect_to "/"
	    else
  	  	flash[:errors] = user.errors.full_messages
  	  	redirect_to "/"
  	  end
    end

  def show
  	@user = User.find(params[:id])
  end
end
