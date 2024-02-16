class LikesController < ApplicationController
  before_action :authenticate_user
  def show
    redirect_to root_path
  end
  def create
      @like = Like.new(
      user_id: params['user_id'], 
      gossip_id: params['gossip_id'])
    
      if @like.save
        redirect_to request.referrer
      end
  end

  def destroy
    Like.find(params[:id].to_i).destroy
    redirect_to request.referrer
  end

  private
end





