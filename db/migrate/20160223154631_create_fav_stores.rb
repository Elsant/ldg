class CreateFavStores < ActiveRecord::Migration
  def change
    create_table :fav_stores do |t|
      t.references :user, index: true, foreign_key: true
      t.string :store

      t.timestamps null: false
    end
  end
end
