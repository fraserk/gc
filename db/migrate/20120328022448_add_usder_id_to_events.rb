class AddUsderIdToEvents < ActiveRecord::Migration
  def change
    #add_column :events, :references, :users
    add_column :events, :user_id, :integer
  end
end
