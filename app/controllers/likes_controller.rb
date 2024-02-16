class LikesController < ApplicationController

  def create
    user_id = User.find(session[:user_id]).id
    gossip_id = params['gossip_id']
    @already_liked = Like.where(user_id: user_id, gossip_id: gossip_id)

    if @already_liked.length.zero?
      @like = Like.new(
      user_id: user_id, 
      gossip_id: gossip_id)
    
      if @like.save
        redirect_to root_path
      end
    else
      @already_liked.first.destroy
      redirect_to root_path
    end
  end

  def delete
    
  end
end
