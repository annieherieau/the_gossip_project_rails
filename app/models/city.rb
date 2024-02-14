class City < ApplicationRecord
  # Table 1-N
  has_many :users

  # Validations
  validates :name, presence: true
  validates :zip_code, presence: true, length: {is: 5}
end
