class User < ApplicationRecord
  belongs_to :city, optional: false
  has_many :posted_gossips, foreign_key: 'posted_gossip_id', class_name: 'Gossip'
  belongs_to :team, optional: true
  has_many :comments
  has_many :commented_gossips, foreign_key: 'commented_gossip_id', class_name: 'Gossip', through: :comments
end
