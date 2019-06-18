class RenameCategoryToPurposeInProperties < ActiveRecord::Migration[5.1]
  def change
    rename_column :properties, :category, :purpose
  end
end
