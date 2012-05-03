class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :fee
      t.datetime :when
      t.text :detail

      t.timestamps
    end
  end
end
