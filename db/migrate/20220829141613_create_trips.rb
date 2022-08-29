class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.string :categories
      t.integer :amount_of_travellers
      t.integer :amount_of_children
      t.boolean :pets
      t.integer :original_trip_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
