class CreateSubtasks < ActiveRecord::Migration[8.0]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.date :due_date
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
