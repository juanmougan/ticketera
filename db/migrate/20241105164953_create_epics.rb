class CreateEpics < ActiveRecord::Migration[8.0]
  def change
    create_table :epics do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.date :due_date
      t.integer :points

      t.timestamps
    end
  end
end
