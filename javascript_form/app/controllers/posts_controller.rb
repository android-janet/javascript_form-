class PostsController < ApplicationController
  def index
     @post = Post.new
     @posts = Post.all
  end

  def new
     @post = Post.new
  end

  def create
     @post = Post.new(post_params)
     respond_to do |format|
        if @post.save
           format.html {redirect_to @post, notice: 'Post was successfully created.' }
           format.js {}
           format.json {render json: @post, status: :created, location: @post }
        else
           format.html {render action: "new"}
           format.json {render json: @post.errors, status: :unprocessable_entity }
       end
    end
  end

  def like
     @post = Post.find(params[:id])
     @post.likes.create
     respond_to do |format|
           format.js {}
           format.json {render json: @post, status: :created, location: @post }
     end
  end

  private
  def post_params
     params.require(:post).permit(:name, :body)
  end








end
