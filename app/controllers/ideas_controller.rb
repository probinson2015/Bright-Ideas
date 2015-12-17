class IdeasController < ApplicationController
  def index
  	@ideas = Idea.all
  	@user = User.find(session[:user_id])
  end

  def create
  	idea = Idea.new(user_id: session[:user_id], comment: params[:comment])
  	if idea.valid?
  		idea.save
  	else
  		flash[:errors] = idea.errors.full_messages
    end
  	redirect_to '/ideas'
  end
  
  	def show
  		@idea = Idea.find(params[:id])
  	end

  	def destroy
  		Idea.find(params[:idea_id]).destroy
  		redirect_to '/ideas'
  	end
end
