class CreateStories < ActiveRecord::Migration[8.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.date :due_date
      t.integer :points
      t.references :epic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
