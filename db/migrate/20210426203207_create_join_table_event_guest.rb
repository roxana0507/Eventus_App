class CreateJoinTableEventGuest < ActiveRecord::Migration[6.1]
  def change
    create_join_table :events, :guests do |t|
      # t.index [:event_id, :guest_id]
      # t.index [:guest_id, :event_id]
    end
  end
end
