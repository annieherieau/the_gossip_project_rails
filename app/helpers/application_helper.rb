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

  def gossip_like_buttons(gossip, user, like_class, unlike_class)
    like = liked_gossip(user, gossip)
    if like.empty?
      button_to 'Like', gossip_likes_path(gossip_id: gossip.id, user_id: user.id), method: :post, class: like_class
    else
      button_to 'Unlike', gossip_like_path(gossip_id: gossip.id, id: like.first.id), method: :delete, class: unlike_class
    end
  end

  def tell(str)
    str.html_safe
  end
end
