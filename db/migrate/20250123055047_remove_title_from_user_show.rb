class RemoveTitleFromUserShow < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_shows, :title, :string
  end
end
