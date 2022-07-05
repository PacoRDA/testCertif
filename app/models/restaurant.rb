class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :reservations
  has_many :ratings

  has_one_attached :photo

  def favorite?(user)
    Favorite.find_by(user: user, restaurant: self)
  end
end
