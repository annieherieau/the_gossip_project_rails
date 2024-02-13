class Team < ApplicationRecord
  # table 1-N
  has_many :users

  # Validations
  validates :name, uniqueness: true, presence: true
  
end
