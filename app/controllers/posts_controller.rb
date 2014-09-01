class PostsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all.paginate(page: params[:page], per_page: 8)
	end

  def show
    @post = Post.find(params[:id])
  end

	def new
		@post = Post.new
		@user = current_user
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else 
			flash[:error] = "Successfully created..."
			render 'new'
		end 
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.update(post_params)
		if @post.save
			redirect_to @post
		else 
			flash[:error] = "There was an error..."
			render 'edit'
		end 
	end

	def destroy
		@post = Post.find(params[:id]).destroy
	end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
