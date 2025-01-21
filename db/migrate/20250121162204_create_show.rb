class CreateShow < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.references :stage, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
