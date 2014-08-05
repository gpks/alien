class Contact < ActiveRecord::Base
  belongs_to :city
  validates :city, presence: true
  validates :number, presence: true
  validates :city_id, presence: true
  validates :objects, presence: true
end
