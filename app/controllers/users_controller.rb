class UsersController < ApplicationController
  
  def welcome
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
end
