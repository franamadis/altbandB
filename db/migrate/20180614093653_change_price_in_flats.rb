class ChangePriceInFlats < ActiveRecord::Migration[5.2]
  def change
    change_column :flats, :price, :integer
  end
end
