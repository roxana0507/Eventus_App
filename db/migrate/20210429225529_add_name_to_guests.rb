class AddNameToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :name, :string
    add_column :guests, :attend, :boolean, default: true
  end
end
