class GossipsController < ApplicationController
  def index
    @gossips_all = Gossip.all
  end
  def show 
    @gossip = Gossip.find(params[:id])
  end

  def new
    # if params['author_id'].to_i > 0
    #   author = User.find(params['author_id'].to_i)
    #   gossip = Gossip.create!(author: author, title: params['title'], content: params['content'])
    #   # redirect_to action: "show", id: gossip.id
  end

  def create

  end

  def edit
    @gossip = Gossip.find(params[:id])
    # gossip = Gossip.find(params['id'].to_i)
  end

  def update
    @gossip = Gossip.find(params[:id])

  end
  def delete
    @gossip = Gossip.find(params[:id])
  end

  
end
