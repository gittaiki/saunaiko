class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :youtube_id, null: false
      t.integer :level, null: false, default: 0

      t.timestamps
    end
    add_index :videos, :youtube_id, unique: true
  end
end
