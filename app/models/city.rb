class City < ApplicationRecord
  # Table 1-N
  has_many :users

  # Validations
  validates :name, :zip_code, presence: true
end
