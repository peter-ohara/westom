class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.references :contact, foreign_key: true
      t.references :property, foreign_key: true
      t.integer :type_of_service
      t.date :request_date
      t.text :request_details
      t.monetize :amount
      t.date :deadline
      t.integer :stage
      t.date :expiration_date

      t.timestamps
    end
  end
end
