class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :event_id
      t.string :stripe_customer_token
      

      t.timestamps
    end
    add_index :subscriptions, :event_id
  end
end
