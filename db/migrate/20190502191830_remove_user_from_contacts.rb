class RemoveUserFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :contacts, :user, foreign_key: true
  end
end
