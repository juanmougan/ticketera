class ChangeStoryIdNullOnBugs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :bugs, :story_id, true
  end
end
