class DeleteNumberFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :number
  end
end
