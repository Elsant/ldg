class CreateSizesets < ActiveRecord::Migration
  def change
    create_table :sizesets do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :shirt,     limit: 3
      t.integer :neck,      limit: 2
      t.integer :jacket,    limit: 3
      t.integer :waist,     limit: 3
      t.decimal :shoe,      limit: 3
      t.integer :height,    limit: 3
      t.integer :weight,    limit: 3

      t.timestamps null: false
    end
  end
end
