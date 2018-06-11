class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_many :users
  has_many :flats
end
