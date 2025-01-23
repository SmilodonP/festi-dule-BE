class RemoveIndexesFromShows < ActiveRecord::Migration[7.1]
  def change
    remove_index :shows, name: "index_shows_on_artist_id"
    remove_index :shows, name: "index_shows_on_stage_id"
  end
end
