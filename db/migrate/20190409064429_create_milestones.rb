class CreateMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :milestones do |t|
      t.string :title
      t.date :start_date
      t.date :due_date
      t.text :description
      t.integer :target_type, null: false, default: 0
      t.decimal :target, precision: 15, scale: 2
      t.integer :department
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
