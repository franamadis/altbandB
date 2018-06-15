class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates_presence_of :arrival, :period, :guests
end
