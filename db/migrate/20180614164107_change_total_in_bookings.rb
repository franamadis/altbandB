class ChangeTotalInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :total, :integer
  end
end
