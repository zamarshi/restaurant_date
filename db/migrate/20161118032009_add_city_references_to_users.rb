class AddCityReferencesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :city, foreign_key: true
    add_reference :users, :cuisine, foreign_key: true
    add_reference :users, :restaurant, foreign_key: true
  end
end
