class User < ActiveRecord::Base
validates :name, presence: true
validates :password, presence: true
validates :password, length: { in: 2..6}
validates :email, format: {with: /@/ }
validates :admin, presence: true

end
