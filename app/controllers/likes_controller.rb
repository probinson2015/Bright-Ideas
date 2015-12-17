class LikesController < ApplicationController
	def create
		Like.create(idea_id: params[:idea_id], user_id: session[:user_id])
		redirect_to '/ideas'
	end
end
