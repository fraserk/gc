class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
    add_index :rsvps, :event_id
  add_index :rsvps, :user_id
  end
  
end
