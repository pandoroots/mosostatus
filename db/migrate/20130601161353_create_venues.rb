class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :count
      t.integer :capacity
      t.text :notification

      t.timestamps
    end
  end
end
