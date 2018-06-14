class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :address, presence: true
  # validates :address, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :max_guests, numericality: {greater_than_or_equal_to: 0 }

end

