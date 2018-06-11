class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :price
      t.integer :max_guests
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
