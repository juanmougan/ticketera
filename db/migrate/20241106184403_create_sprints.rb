class CreateSprints < ActiveRecord::Migration[8.0]
  def change
    create_table :sprints do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :status

      t.timestamps
    end
    add_column :sprints, :task_order, :string, array: true, default: []    
  end
end
