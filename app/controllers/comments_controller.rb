class CommentsController < ApplicationController
  before_action :authenticate_user
  def create
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new(
      commented_gossip: @gossip,
      commenting_user: current_user,
      content: params['content']
      )
    if @comment.save
      redirect_to gossip_path(@gossip)
    end
  end
  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    redirect_to gossip_path(@gossip) unless is_owner_of_comment?(@comment.id)
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(content: params['content'])
      redirect_to gossip_path(@gossip)
    else
      render :edit
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip), notice: 'Supprimé !'
  end

end
