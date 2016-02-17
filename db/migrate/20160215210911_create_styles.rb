class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :gender_preference,    limit: 1
      t.integer :work_style,           limit: 1
      t.integer :evening_style,        limit: 1
      t.integer :shirt_fit,            limit: 1
      t.integer :pants_fit,            limit: 1
      t.integer :store,                limit: 3

      t.timestamps null: false
    end
  end
end
