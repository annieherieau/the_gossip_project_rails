module ApplicationHelper
  def find_gossip_comments(id)
    Comment.where(commented_gossip_id: id)
  end
  def find_gossip_likes(id)
    Like.where(gossip_id: id)
  end

  def liked_gossip(user_id, gossip_id)
    Like.where(user_id: user_id, gossip_id: gossip_id)
  end

  def find_city(user_id)
    User.find(user_id).city
  end
end
