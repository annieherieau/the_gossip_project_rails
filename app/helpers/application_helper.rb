module ApplicationHelper
  def find_gossip_comments(id)
    Comment.where(commented_gossip_id: id)
  end
  def find_gossip_likes(id)
    Like.where(gossip_id: id)
  end
  def find_comment_likes(id)
    Like.where(comment_id: id)
  end

  def liked_gossip(user, gossip)
    Like.where(user_id: user.id, gossip_id: gossip.id)
  end

  def find_city(user_id)
    User.find(user_id).city
  end
end
