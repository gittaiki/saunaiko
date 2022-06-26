class CreateActives < ActiveRecord::Migration[6.0]
  def change
    create_table :actives do |t|
      t.date :visited_on, null: false
      t.integer :sauna_minute, null: false
      t.integer :water_bath_minute, null: false
      t.integer :break_minute, null: false
      t.integer :cycle_count, null: false
      t.integer :score, default: 60, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
