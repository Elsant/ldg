class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.references :user, index: true, foreign_key: true
      t.string  :title
      t.integer :style, limit: 1
      t.timestamp :occasion_time

      t.timestamps null: false
    end
  end
end
