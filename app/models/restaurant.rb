class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :favorites
  has_one_attached :photo

  def favorite?(user)
    Favorite.find_by(user: user, restaurant: self)
  end
end
