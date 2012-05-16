class AddNameToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :name, :string
    add_column :messages, :email, :string
    add_column :messages, :subject, :string
    add_column :messages, :body, :string
  end
end
