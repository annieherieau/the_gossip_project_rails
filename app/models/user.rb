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
  # attr_accessor :password_confirmation, :email_confirmation

  # VALIDATIONS
  validates :first_name, :last_name, presence: true
  validates :email, presence: true , uniqueness: true, confirmation: true

  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :password,  presence: true,  confirmation: true
 


  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    @password == password
    errors.add :password, 'Passwords not identical'
  end

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end

  private
  def password_complexity
    return if password.blank? || password.length >= 8 && password.match(/\d/) && password.match(/[a-z]/) && password.match(/[A-Z]/) && password.match(/[^a-zA-Z\d]/)
    errors.add :password, 'Password must be at least 8 characters long and include at least one digit, one lowercase letter, one uppercase letter, and one special character.'
  end
end
