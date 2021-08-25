class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to user_path(@user), notice: "Great success!!!"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end
end
