class AddAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :description, :text
  end
end
