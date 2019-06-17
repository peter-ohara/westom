class AddPriceToProperties < ActiveRecord::Migration[5.1]
  add_monetize :properties, :price
end
