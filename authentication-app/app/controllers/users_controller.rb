class UsersController < ApplicationController
    # GET /users
    def index
      @users = User.all
  
      render json: @users.to_json(include: [:posts, :comments])
    end
  
    # GET /users/1
    def show
      # user_posts = @user.posts
      # user_comments = @user.comments  
      # render json: { user: @user, posts: user_posts, comments: user_comments }
      @user = User.find(params[:id])
      render json: @user.to_json(include: [:posts, :comments])
    end
  
  
    # PATCH/PUT /users/1
    def update
        @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @user = User.find(params[:id])
      @user.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:avatar, :nickname, :spec, :server_region, :server)
      end
  end