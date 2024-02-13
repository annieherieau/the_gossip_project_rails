class Gossip < ApplicationRecord
  # Table N-1
  belongs_to :author, class_name: 'User', optional: false
  # Table N-N
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  # Table N-N
  has_many :comments
  has_many :commenting_users, foreign_key: 'commenting_user_id', class_name: 'User', through: :comments
  # Table N-N
  has_many :likes
  # todo hasm_many liking_user through likes

  # Validations
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true



end
