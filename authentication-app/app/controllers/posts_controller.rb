class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  # GET /posts
  def index
    @posts = Post.all

    render json: @posts.to_json(include: :comments)
  end

  # GET /posts/1
  def show
    render json: @post.to_json(include: :comments)
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = params[:user_id]
    @post.likes = 0 

    if @post.save
      render json: @post, status: :created 
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :user_display, :user_avatar)
    end
end
