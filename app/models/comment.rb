class Comment < ApplicationRecord
   # Table N-1
  belongs_to :commented_gossip, class_name: 'Gossip', optional: false
  belongs_to :commenting_user, class_name: 'User', optional: false
  # Table 1-N
  has_many :likes

  # Validations
  validates :content, presence: true

  # scope :name, -> { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
  scope :user, lambda { where(:attibute => value)}
  # Ex:- scope :active, lambda {where(:active => true)}

end
