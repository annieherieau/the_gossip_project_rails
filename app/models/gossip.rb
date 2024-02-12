class Gossip < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags

end
