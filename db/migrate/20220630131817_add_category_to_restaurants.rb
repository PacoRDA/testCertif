class AddCategoryToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_reference :restaurants, :category, foreign_key: true
  end
end
