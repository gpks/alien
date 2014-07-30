class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :objects
      t.integer :number
      t.integer :city_id

      t.timestamps
    end
  end
end
