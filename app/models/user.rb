class User < ApplicationRecord
  belongs_to :city, optional: false
end
