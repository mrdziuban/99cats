class User < ActiveRecord::Base
  attr_accessible :username, :password, :session_token

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  has_many :cats
end