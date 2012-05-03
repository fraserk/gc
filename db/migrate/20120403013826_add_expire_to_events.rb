class AddExpireToEvents < ActiveRecord::Migration
  def change
    add_column :events, :expire, :boolean, :default => false
  end
end
