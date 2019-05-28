class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.references :deal, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :due_date
      t.datetime :completion_date

      t.timestamps
    end
  end
end
