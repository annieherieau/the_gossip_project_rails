class LikesController < ApplicationController

  def create
    user_id = params['user_id']
    gossip_id = params['gossip_id']
    @already_liked = Like.where(user_id: user_id, gossip_id: gossip_id)

    if @already_liked.length.zero?
      @like = Like.new(
      user_id: params['user_id'], 
      gossip_id: params['gossip_id'])
    
      if @like.save
        redirect_to(:back)
      end
    else
      @already_liked.first.destroy
      redirect_to(:back)
    end
  end

  private
  def post_params
    post_params = params.require(:like).permit(:gossip_id, :user_id)
  end
end
