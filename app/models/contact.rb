class Contact < ActiveRecord::Base
  belongs_to :city
  validates :number, presence: true
  validates :city_id, presence: true
  validates :objects, presence: true
end
