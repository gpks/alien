class City < ActiveRecord::Base
  has_many :contacts
  validates :name, presence: true
  validates :name, uniqueness: true
  paginates_per 10

end
