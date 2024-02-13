class Like < ApplicationRecord
  # table N-1
  belongs_to :user, optional: false
  belongs_to :gossip, optional: true
  belongs_to :comment, optional: true
end
