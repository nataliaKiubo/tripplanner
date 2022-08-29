class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.date :date
      t.string :name
      t.string :address
      t.text :description
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
