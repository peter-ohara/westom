class AddStatusToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :status, :string
  end
end
