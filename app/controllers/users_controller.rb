
class UsersController < ApplicationController
  def welcome
    @user = User.find(params[:id])
  end
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @city = @user.city
    @gossips = Gossip.where(author_id: @user.id)
    @comments = Comment.where(commenting_user_id: @user.id)
    @likes = Like.where(user_id: @user.id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
