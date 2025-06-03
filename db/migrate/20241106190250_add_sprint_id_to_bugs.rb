class AddSprintIdToBugs < ActiveRecord::Migration[8.0]
  def change
    add_reference :bugs, :sprint, null: true, foreign_key: true
  end
end
