require 'bcrypt'
class User < ApplicationRecord

  # table N-1
  belongs_to :city, optional: true
  # table N-N
  has_many :posted_gossips, foreign_key: 'posted_gossip_id', class_name: 'Gossip'
  # table N-1
  belongs_to :team, optional: true
  # table N-N
  has_many :comments
  has_many :commented_gossips, foreign_key: 'commented_gossip_id', class_name: 'Gossip', through: :comments
  # table N-N
  has_many :likes
  # todo: has_many liked comments/gossip through

  # Bcrypt
  # users.password_hash in the database is a :string
  include BCrypt

  # VALIDATIONS
  validates :first_name, :last_name, presence: true
  validates :email, presence: true , uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :password, presence: true, length: { minimum: 8 } # password du user (non conservé dans BDD, mais crypté dans password_hash)


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # authification lors du loggin (pwd tapé == pwd enregistré)
  def authenticate(password)
    @password == password
  end
end
