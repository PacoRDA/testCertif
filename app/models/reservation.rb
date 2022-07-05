class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :ratings, dependent: :destroy
  validates :date, :guests_number, presence: true
end
