class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.text :location
      t.integer :category
      t.integer :property_type
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
