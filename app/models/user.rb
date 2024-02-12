class User < ApplicationRecord
  belongs_to :city, optional: false
  has_many :posted_gossips, foreign_key: 'posted_gossip_id', class_name: 'Gossip'
  belongs_to :team, optional: true
end
