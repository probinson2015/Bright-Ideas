class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 8}, on: :create
  has_many :ideas
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :idea
end
