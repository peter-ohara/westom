class AddClosingDateToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :date_of_closing, :date
  end
end
