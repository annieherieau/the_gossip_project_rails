class Tag < ApplicationRecord
  # table 1-N
  has_many :gossip_tags
  has_many :gossips, through: :gossip_tags

  # Validations
  validates :title, uniqueness: true, presence: true

end
