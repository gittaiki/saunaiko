class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end

    add_index :bookmarks, [:user_id, :video_id], unique: true
  end
end
