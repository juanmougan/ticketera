class ChangeEpicIdNullOnStories < ActiveRecord::Migration[8.0]
  def change
    change_column_null :stories, :epic_id, true
  end
end
