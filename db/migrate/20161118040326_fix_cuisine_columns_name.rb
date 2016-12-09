class FixCuisineColumnsName < ActiveRecord::Migration[5.0]
  def change
    rename_column :cuisines, :title, :name
  end
end
