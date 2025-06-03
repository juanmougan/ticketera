class AddSprintIdToStories < ActiveRecord::Migration[8.0]
  def change
    add_reference :stories, :sprint, null: true, foreign_key: true
  end
end
