class Gossip < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :gossip_tags
  has_many :tags, through: :gossip_tags

  has_many :comments
  has_many :commenting_users, foreign_key: 'commenting_user_id', class_name: 'User', through: :comments
end
