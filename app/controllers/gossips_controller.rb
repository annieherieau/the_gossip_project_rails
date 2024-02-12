class GossipsController < ApplicationController
  def index
  end

  def new
    if params['author_id'].to_i > 0
      author = User.find(params['author_id'].to_i)
      gossip = Gossip.create!(author: author, title: params['title'], content: params['content'])
      redirect_to action: "show", id: gossip.id
    end
    
  end

  def show
    
  end

  def edit
    gossip = Gossip.find(params['id'].to_i)
  end
end
