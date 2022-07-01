class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :date, :guests_number, presence: true
end
