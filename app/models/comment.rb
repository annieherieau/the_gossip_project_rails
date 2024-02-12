class Comment < ApplicationRecord
  belongs_to :commented_gossip, class_name: 'Gossip'
  belongs_to :commenting_user, class_name: 'User'
end
