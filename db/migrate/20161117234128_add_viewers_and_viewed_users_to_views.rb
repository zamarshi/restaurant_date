class AddViewersAndViewedUsersToViews < ActiveRecord::Migration[5.0]
  def change
    add_column :views, :viewer_id, :integer, foreign_key: true
    add_column :views, :viewed_user_id, :integer, foreign_key: true
  end
end
