class RemoveNameFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :name, :string
  end
end
