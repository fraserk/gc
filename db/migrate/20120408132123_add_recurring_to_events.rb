class AddRecurringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :recurr, :boolean, :default => false
  end
end
