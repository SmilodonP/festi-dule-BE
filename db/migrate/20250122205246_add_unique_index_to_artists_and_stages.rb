class AddUniqueIndexToArtistsAndStages < ActiveRecord::Migration[7.1]
  def change
    add_index :artists, :name, unique: true
    add_index :stages, :name, unique: true
  end
end
