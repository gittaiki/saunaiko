class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :youtube_id, null: false
      t.string :address, null: false
      t.string :sauna, null: false

      t.timestamps
    end
    add_index :videos, :youtube_id, unique: true
  end
end
