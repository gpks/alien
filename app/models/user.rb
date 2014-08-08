class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, format: {with: /@/ }
  validates :email, uniqueness: true
end
