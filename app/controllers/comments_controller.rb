class CommentsController < ApplicationController

  def create
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new(
      commented_gossip: @gossip,
      commenting_user:  ApplicationController.new.loged_user,
      content: params['content']
      )
    if @comment.save
      redirect_to gossip_path(@gossip)
    end
  end
  def edit
    @comment = Comment.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:gossip_id])
    if @comment.update(content: params['content'])
      redirect_to gossip_path(@comment.commented_gossip)
    else
      render :edit
    end
  end

  def destroy

  end

end
