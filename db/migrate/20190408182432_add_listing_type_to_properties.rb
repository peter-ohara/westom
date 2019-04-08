class AddListingTypeToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :listing_type, :integer, null: false, default: 0
  end
end
