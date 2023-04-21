class AddReferencesUserToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_reference :restaurants, :user, index: true
  end
end
