class AddTripIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :trip_id, :bigint
  end
end
