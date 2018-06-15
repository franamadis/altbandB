class AddArrivalToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :arrival, :date
  end
end
