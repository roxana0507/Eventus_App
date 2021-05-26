class CreateJoinTableHostEvent < ActiveRecord::Migration[6.1]
  def change
    create_join_table :hosts, :events do |t|
      # t.index [:host_id, :event_id]
      # t.index [:event_id, :host_id]
    end
  end
end
