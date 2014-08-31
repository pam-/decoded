class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def show
		@index = index.find(params[:id])
	end

	def create
		@comment = Comment.new(comment_params)
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@post = 
		@comment = Comment.update(comment_params)
		if @comment.save
			redirect_to @post
		else 
			flash[:error] = "Something went wrong..."
			redirect_to @post
		end 
	end

	def destroy
		@comment = Comment.find(params[:id]).destroy
	end
end