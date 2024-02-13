class GossipTag < ApplicationRecord
  # table N-1
  belongs_to :gossip, optional: false
  belongs_to :tag, optional: false

  # Validataion
  validates :gossip, :tag, presence: true

end
