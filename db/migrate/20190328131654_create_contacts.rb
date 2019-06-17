class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name

      t.string :mobile
      t.string :email

      t.date :date_of_birth
      t.text :present_address

      t.text :notes

      t.timestamps
    end
  end
end
