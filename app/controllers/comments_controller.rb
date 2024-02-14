class CommentsController < ApplicationController
  def new
    @gossip = Gossip.find(params[:id])
    
  end
  def create
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new(
      commented_gossip: @gossip,
      commenting_user:  ApplicationController.new.loged_user,
      content: params['content']
      )
    if @comment.save
      redirect_to gossip_path(@gossip)
    else
      params['error'] = 'erreur'
    end
  end
  def edit
  end

  def update
  end

  def destroy

  end
end
